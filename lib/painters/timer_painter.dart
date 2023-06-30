import 'dart:math';

import 'package:timelapps/all_imports.dart';

class TimerPainter extends CustomPainter {
  // timerValue is fetched from user interaction. WidgetRef is used to
  // watch the necessary Riverpod Providers.
  final WidgetRef ref;
  final double timerValue;
  final double maxValue;

  TimerPainter(this.ref, {this.timerValue = 0, this.maxValue = 60});

  @override
  void paint(Canvas canvas, Size size) {
    // Get some reference points
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = min(size.width, size.height) / 3;
    final double fillPercentage = timerValue / maxValue;

    // This is where the draggable circle gets it's parameters.
    // Use the isColorRedProvider and the isThemeLightProvider to determine the
    // color of the draggable circle.
    final Paint paint = Paint()
      ..color = ref.watch(isColorRedProvider) && ref.watch(isThemeLightProvider)
          ? FlexColor.moneyLightPrimary
          : ref.watch(isColorRedProvider) && !ref.watch(isThemeLightProvider)
              ? FlexColor.moneyDarkPrimary
              : !ref.watch(isColorRedProvider) &&
                      ref.watch(isThemeLightProvider)
                  ? FlexColor.redWineLightPrimary
                  : FlexColor.redWineDarkPrimary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 80.0;

    // This is where the minute markers get their parameters.
    // Use the isThemeGreenProvider and the isThemeLightProvider to determine
    // the color of the minute markers.
    final Paint markerPaint = Paint()
      ..strokeWidth = 2
      ..color = ref.watch(isThemeGreenProvider) &&
              ref.watch(isThemeLightProvider)
          ? FlexColor.moneyLightPrimaryVariant
          : ref.watch(isThemeGreenProvider) && !ref.watch(isThemeLightProvider)
              ? FlexColor.moneyDarkPrimaryVariant
              : !ref.watch(isThemeGreenProvider) &&
                      ref.watch(isThemeLightProvider)
                  ? FlexColor.redWineLightPrimaryVariant
                  : FlexColor.redWineDarkPrimaryVariant;
    const double markerLength = 20.0;
    final int markerCount = maxValue.toInt();

    // Get the minute markers angles, start and end positions.
    // ChatGPT helped with the cos and sin functions.
    for (int i = 0; i < markerCount; i++) {
      final double markerAngle = (2 * pi / markerCount) * i - pi / 2;
      final Offset markerStart = Offset(
        center.dx + (radius - markerLength / 2) * cos(markerAngle),
        center.dy + (radius - markerLength / 2) * sin(markerAngle),
      );
      final Offset markerEnd = Offset(
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
