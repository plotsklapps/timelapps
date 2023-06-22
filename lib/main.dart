import 'dart:async';
import 'dart:math';

import 'package:timelapps/all_imports.dart';

import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MainEntry()));
}

class MainEntry extends ConsumerWidget {
  const MainEntry({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timelapps',
      theme: ref.watch(themeLightProvider),
      darkTheme: ref.watch(themeDarkProvider),
      themeMode: ref.watch(themeModeProvider),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  // Set initial timer value to 15 minutes
  double timerSeconds = 15;
  Timer? timer;
  bool isRunning = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    if (timer != null) {
      timer!.cancel();
    }

    setState(() {
      isRunning = true;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timerSeconds > 1) {
          timerSeconds -= 1;
        } else {
          timerSeconds = 0;
          stopTimer(); // Call stopTimer when timerMinutes reaches 0
        }
      });
    });
  }

  void stopTimer() {
    setState(() {
      isRunning = false;
    });
    timer!.cancel();
  }

  void onDragUpdate(DragUpdateDetails details, Size circleSize) {
    // Only if the timer is NOT running, the timer can be adjusted
    if (!isRunning) {
      final touchPositionFromCenter = details.localPosition -
          Offset(circleSize.width / 2, circleSize.height / 2);
      final touchAngle =
          atan2(touchPositionFromCenter.dy, touchPositionFromCenter.dx);

      // Convert angle to degrees and add 90 (so 0 degrees is at top)
      // Then mod by 360 to get value from 0-360, and divide by 6 to get minutes
      setState(() {
        timerSeconds = (((touchAngle * 180 / pi) + 90) % 360) / 6;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                          timerValue: timerSeconds,
                          maxValue: 60,
                        ),
                      ),
                      ref.watch(isTimeShownProvider)
                          ? Text(
                              timerSeconds.toStringAsFixed(0),
                              style: const TextStyle(fontSize: 50),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: isRunning ? stopTimer : startTimer,
        label: Text(isRunning ? 'Stop' : 'Start'),
        icon: Icon(isRunning ? Icons.stop : Icons.play_arrow),
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  final double timerValue;
  final double maxValue;

  TimerPainter({this.timerValue = 0, this.maxValue = 60});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 3;
    final fillPercentage = timerValue / maxValue;

    final paint = Paint()
      ..color = FlexColor.redWineLightPrimary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 80.0;

    // Paint minute marks
    final markerPaint = Paint()..strokeWidth = 2;

    const markerLength = 15.0;
    final markerCount = maxValue.toInt();

    for (int i = 0; i < markerCount; i++) {
      final markerAngle = (2 * pi / markerCount) * i - pi / 2;
      final markerStart = Offset(
        center.dx + (radius - markerLength / 2) * cos(markerAngle),
        center.dy + (radius - markerLength / 2) * sin(markerAngle),
      );
      final markerEnd = Offset(
        center.dx + (radius + markerLength / 2) * cos(markerAngle),
        center.dy + (radius + markerLength / 2) * sin(markerAngle),
      );
      canvas.drawLine(markerStart, markerEnd, markerPaint);
    }

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * fillPercentage,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(TimerPainter oldDelegate) {
    return oldDelegate.timerValue != timerValue;
  }
}
