import 'dart:math';

import 'package:timelapps/all_imports.dart';

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
