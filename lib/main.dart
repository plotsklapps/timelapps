import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:timelapps/flexscheme.dart';

void main() {
  runApp(const MainEntry());
}

class MainEntry extends StatelessWidget {
  const MainEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer App',
      theme: themeLight,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
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
            isRunning
                ? const SizedBox()
                : NavigationRail(
                    selectedIndex: 0,
                    onDestinationSelected: (int index) {
                      setState(() {
                        // _selectedIndex = index;
                      });
                    },
                    labelType: NavigationRailLabelType.all,
                    destinations: const <NavigationRailDestination>[
                      NavigationRailDestination(
                        icon: Icon(Icons.timer),
                        selectedIcon: Icon(Icons.timer),
                        label: Text('Timer'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.settings),
                        selectedIcon: Icon(Icons.settings),
                        label: Text('Settings'),
                      ),
                    ],
                  ),
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
                      Text(
                        timerSeconds.toStringAsFixed(0),
                        style: const TextStyle(fontSize: 50),
                      ),
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
      ..color = Colors.primaries.first
      ..style = PaintingStyle.stroke
      ..strokeWidth = 80.0;

    // Paint minute marks
    final markerPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

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
