import 'dart:math';

import 'package:timelapps/all_imports.dart';

class TimerPainter extends CustomPainter {
  // timerValue is fetched from user interaction. WidgetRef is used to
  // watch the isColorRedProvider.
  final double timerValue;
  final double maxValue;
  final WidgetRef ref;

  TimerPainter(this.ref, {this.timerValue = 0, this.maxValue = 60});

  @override
  void paint(Canvas canvas, Size size) {
    // Get some reference points
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 3;
    final fillPercentage = timerValue / maxValue;

    // This is where the draggable circle gets it's parameters.
    // Use the isColorRedProvider to determine the color of the draggable
    // circle.
    final paint = Paint()
      ..color = ref.watch(isColorRedProvider)
          ? FlexColor.redWineLightPrimary
          : FlexColor.moneyLightPrimary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 80.0;

    // This is where the minute markers get their parameters.
    final markerPaint = Paint()..strokeWidth = 2;
    const markerLength = 20.0;
    final markerCount = maxValue.toInt();

    // Get the minute markers angles, start and end positions.
    // ChatGPT helped with the cos and sin functions.
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
      // Draw the minute markers.
      canvas.drawLine(markerStart, markerEnd, markerPaint);
    }

    // Draw the draggable circle.
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * fillPercentage,
      false,
      paint,
    );
  }

  // If the timerValue changes, the widget needs to be repainted.
  @override
  bool shouldRepaint(TimerPainter oldDelegate) {
    return oldDelegate.timerValue != timerValue;
  }
}
