import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:timelapps/all_imports.dart';

class DualScreen extends ConsumerStatefulWidget {
  const DualScreen({super.key});

  @override
  ConsumerState<DualScreen> createState() {
    return DualScreenState();
  }
}

class DualScreenState extends ConsumerState<DualScreen> {
  // We need two timers, one for seconds, one for minutes, chosen by
  // the user in the navigationrail. They are nullable because they
  // are only initialized when the timer is running.
  // Also, we create a late instance of AudioPlayer (instantiated
  // in initState method).
  Timer? secondsTimer;
  Timer? minutesTimer;
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    // Kill the timers and audioPlayer when the widget is disposed
    secondsTimer?.cancel();
    minutesTimer?.cancel();
    unawaited(audioPlayer.dispose());
    super.dispose();
  }

  void startTimer() {
    // First, set the 'Timer is running' boolean to true
    ref.read(isRunningProvider.notifier).state = true;
    // Second, check if the user wants to see minutes or seconds, then
    // start the corresponding timer. When the timer reaches 0, call
    // stopTimer() to stop the timer and reset the 'Timer is running' boolean.
    if (ref.watch(isMinutesShownProvider)) {
      minutesTimer = Timer.periodic(const Duration(minutes: 1), (_) async {
        if (ref.watch(minutesProvider) > 1) {
          ref.read(minutesProvider.notifier).state--;
        } else {
          ref.read(minutesProvider.notifier).state = 0;
          await stopTimer();
        }
      });
    } else {
      secondsTimer = Timer.periodic(const Duration(seconds: 1), (_) async {
        if (ref.watch(secondsProvider) > 1) {
          ref.read(secondsProvider.notifier).state--;
        } else {
          ref.read(secondsProvider.notifier).state = 0;
          await stopTimer();
        }
      });
    }
  }

  Future<void> stopTimer() async {
    // First, set the 'Timer is running' boolean to false
    ref.read(isRunningProvider.notifier).state = false;
    // Second, cancel the active timers.
    secondsTimer?.cancel();
    minutesTimer?.cancel();
    // Third, play the chosen bell sound
    await audioPlayer.setAsset(ref.watch(bellSoundProvider)).then((_) {
      return audioPlayer.play().then((_) {
        // The following code makes sure the sound is played to the end
        return audioPlayer.playerStateStream.firstWhere((PlayerState state) {
          return state.processingState == ProcessingState.completed;
        });
      });
    });
  }

  void onDragUpdate(DragUpdateDetails details, Size circleSize) {
    // Only if the timer is NOT running, the timer can be adjusted
    if (!ref.watch(isRunningProvider)) {
      // Calculate the angle of the touch relative to the center of the circle
      final Offset touchPositionFromCenter = details.localPosition -
          Offset(circleSize.width / 2, circleSize.height / 2);
      // Calculate the angle of the touch relative to the axes.
      final double touchAngle =
          atan2(touchPositionFromCenter.dy, touchPositionFromCenter.dx);
      // First, check if the user wants to see minutes or seconds, then
      // convert angle to degrees and add 90 (so 0 degrees is at top)
      // Then mod by 360 to get value from 0-360, and divide by 6 to get
      // minutes. This is where ChatGPT came in handy.
      if (ref.watch(isMinutesShownProvider)) {
        ref.read(minutesProvider.notifier).state =
            (((touchAngle * 180 / pi) + 90) % 360) / 6;
      } else {
        ref.read(secondsProvider.notifier).state =
            (((touchAngle * 180 / pi) + 90) % 360) / 6;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          // Only show the navigation rail when the timer is NOT running
          if (ref.watch(isRunningProvider))
            const SizedBox()
          else
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraint) {
                // The SingleChildScrollView gets wrapped in a
                // ScrollConfiguration to disable the scrollbar on web and
                // give it more scrollable options with different devices.
                return ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(
                    scrollbars: false,
                    dragDevices: <PointerDeviceKind>{
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.trackpad,
                      PointerDeviceKind.touch,
                      PointerDeviceKind.stylus,
                    },
                  ),
                  child: SingleChildScrollView(
                    // The ConstrainedBox with IntrinsicHeight makes sure
                    // the navigation rail is scrollable.
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraint.maxHeight),
                      child: IntrinsicHeight(
                        child: buildDualNavigationRail(context, ref)
                            .animate()
                            .slideX(
                                begin: -1.0,
                                end: 0.0,
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.easeInOut),
                      ),
                    ),
                  ),
                );
              },
            ),
          // We need to show two three items in a column. First one (Text)
          // is the name of the noise, the second and third are wrapped in
          // separate Expanded widgets to make sure they take up the same
          // amount of space.
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Show the value of the noiselevel.
                Text(
                  ref.watch(noiseNameProvider),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      // Get the max width and height of the available
                      // space
                      final double maxWidth = constraints.maxWidth;
                      final double maxHeight = constraints.maxHeight;
                      return Center(
                        child: CustomPaint(
                          size: Size(maxHeight, maxWidth),
                          painter: TrafficLightPainter(
                            ref: ref,
                            redOn: ref.watch(isRedOnProvider),
                            yellowOn: ref.watch(isYellowOnProvider),
                            greenOn: ref.watch(isGreenOnProvider),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Expanded>[
                      // Use an expanded widget to fill the remaining space
                      Expanded(
                        child: LayoutBuilder(builder:
                            (BuildContext context, BoxConstraints constraints) {
                          // Get the max width and height of the screen and use
                          // it to calculate the max size of the circle.
                          final Size circleSize =
                              Size(constraints.maxWidth, constraints.maxHeight);
                          return GestureDetector(
                            // When the user drags on the screen, call
                            // onDragUpdate().
                            onPanUpdate: (DragUpdateDetails details) {
                              onDragUpdate(details, circleSize);
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                CustomPaint(
                                  size: circleSize,
                                  painter: TimerPainter(
                                    // ref is added to use Riverpod inside the
                                    // widget.
                                    ref,
                                    // The timer value is either minutes or
                                    // seconds, depending on the user's choice.
                                    timerValue:
                                        ref.watch(isMinutesShownProvider)
                                            ? ref.watch(minutesProvider)
                                            : ref.watch(secondsProvider),
                                    maxValue: 60,
                                  ),
                                ),
                                // Check if the user wants to see minutes or
                                // seconds, then check if the user wants to
                                // see the time or not.
                                if (ref.watch(isMinutesShownProvider))
                                  ref.watch(isTimeShownProvider)
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Text>[
                                            Text(
                                                ref
                                                    .watch(minutesProvider)
                                                    .toStringAsFixed(0),
                                                style: const TextStyle(
                                                    fontSize: 50)),
                                            const Text('m'),
                                          ],
                                        )
                                      : const SizedBox()
                                else
                                  ref.watch(isTimeShownProvider)
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Text>[
                                            Text(
                                                ref
                                                    .watch(secondsProvider)
                                                    .toStringAsFixed(0),
                                                style: const TextStyle(
                                                    fontSize: 50)),
                                            const Text('s'),
                                          ],
                                        )
                                      : const SizedBox(),
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        // Check the 'Timer is running' boolean to see if the timer is running.
        // If it is, show the stop button, otherwise show the start button.
        onPressed: ref.watch(isRunningProvider) ? stopTimer : startTimer,
        label: Text(
          ref.watch(isRunningProvider) ? 'STOP' : 'START',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: Icon(ref.watch(isRunningProvider)
            ? FontAwesomeIcons.stop
            : FontAwesomeIcons.play),
      ),
    );
  }
}
