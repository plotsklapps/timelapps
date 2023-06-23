import 'dart:async';
import 'dart:math';

import 'package:timelapps/all_imports.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  Timer? secondsTimer;
  Timer? minutesTimer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    secondsTimer?.cancel();
    minutesTimer?.cancel();
    super.dispose();
  }

  void startTimer() {
    ref.read(isRunningProvider.notifier).state = true;

    if (ref.watch(isMinutesShownProvider)) {
      minutesTimer = Timer.periodic(const Duration(minutes: 1), (minutesTimer) {
        if (ref.watch(minutesProvider) > 1) {
          ref.read(minutesProvider.notifier).state--;
        } else {
          ref.read(secondsProvider.notifier).state = 0;
          stopTimer();
        }
      });
    } else {
      secondsTimer = Timer.periodic(const Duration(seconds: 1), (secondsTimer) {
        if (ref.watch(secondsProvider) > 1) {
          ref.read(secondsProvider.notifier).state--;
        } else {
          ref.read(secondsProvider.notifier).state = 0;
          stopTimer();
        }
      });
    }
  }

  void stopTimer() {
    ref.read(isRunningProvider.notifier).state = false;
    secondsTimer?.cancel();
    minutesTimer?.cancel();
  }

  void onDragUpdate(DragUpdateDetails details, Size circleSize) {
    bool isRunning = ref.watch(isRunningProvider);
    // Only if the timer is NOT running, the timer can be adjusted
    if (!isRunning) {
      final touchPositionFromCenter = details.localPosition -
          Offset(circleSize.width / 2, circleSize.height / 2);
      final touchAngle =
          atan2(touchPositionFromCenter.dy, touchPositionFromCenter.dx);

      // Convert angle to degrees and add 90 (so 0 degrees is at top)
      // Then mod by 360 to get value from 0-360, and divide by 6 to get minutes
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
    bool isRunning = ref.watch(isRunningProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 32.0),
        child: Row(
          children: [
            isRunning ? const SizedBox() : buildNavigationRail(ref),
            Expanded(
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                final circleSize =
                    Size(constraints.maxWidth, constraints.maxHeight);
                return GestureDetector(
                  onPanUpdate: (details) {
                    onDragUpdate(details, circleSize);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        size: circleSize,
                        painter: TimerPainter(
                          timerValue: ref.watch(isMinutesShownProvider)
                              ? ref.watch(minutesProvider)
                              : ref.watch(secondsProvider),
                          maxValue: 60,
                        ),
                      ),
                      ref.watch(isMinutesShownProvider)
                          ? ref.watch(isTimeShownProvider)
                              ? Text(
                                  ref.watch(minutesProvider).toStringAsFixed(0),
                                  style: const TextStyle(fontSize: 50))
                              : const SizedBox()
                          : ref.watch(isTimeShownProvider)
                              ? Text(
                                  ref.watch(secondsProvider).toStringAsFixed(0),
                                  style: const TextStyle(fontSize: 50))
                              : const SizedBox(),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: isRunning ? stopTimer : startTimer,
        label: Text(isRunning ? 'Stop' : 'Start'),
        icon: Icon(isRunning ? Icons.stop : Icons.play_arrow),
      ),
    );
  }
}
