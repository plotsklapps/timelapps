import 'package:timelapps/all_imports.dart';

class TrafficLightPainter extends CustomPainter {
  WidgetRef ref;
  final bool redOn;
  final bool yellowOn;
  final bool greenOn;

  TrafficLightPainter({
    required this.ref,
    required this.redOn,
    required this.yellowOn,
    required this.greenOn,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = ref.watch(isThemeGreenProvider)
          ? FlexColor.moneyLightPrimaryVariant
          : FlexColor.redWineLightPrimaryVariant
      ..style = PaintingStyle.fill;

    final Paint lightOnPaint = Paint()..style = PaintingStyle.fill;

    final Paint lightOffPaint = Paint()
      ..color = Colors.grey.shade600
      ..style = PaintingStyle.fill;

    // Use a proportion of the size to define the dimensions of the lights
    // and body
    final double bodyWidth = size.width * 0.3;
    final double bodyHeight = size.height * 0.9;
    final double lightRadius = bodyWidth * 0.3;

    // Center of the canvas
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    // Top-left position of the rectangle
    final double rectStartX = centerX - bodyWidth / 2;
    final double rectStartY = centerY - bodyHeight / 2;

    // Draw traffic light body with rounded corners
    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(rectStartX, rectStartY, bodyWidth, bodyHeight),
          Radius.circular(bodyWidth * 0.24),
        ),
        paint);

    // Shimmer effect for active light
    final Paint shimmerPaint = Paint()
      ..shader = RadialGradient(
        colors: <Color>[Colors.white, Colors.white.withOpacity(0.0)],
        stops: const <double>[0.0, 0.8],
      ).createShader(Rect.fromCircle(
          center: Offset(centerX, centerY - bodyHeight / 3),
          radius: lightRadius));

    // Draw red light
    lightOnPaint.color =
        redOn ? FlexColor.redWineLightPrimary : Colors.red.shade800;
    canvas.drawCircle(Offset(centerX, centerY - bodyHeight / 3), lightRadius,
        redOn ? lightOnPaint : lightOffPaint);
    if (redOn) {
      shimmerPaint.shader = RadialGradient(
        colors: <Color>[Colors.white, Colors.white.withOpacity(0.0)],
        stops: const <double>[0.0, 0.8],
      ).createShader(Rect.fromCircle(
          center: Offset(centerX, centerY - bodyHeight / 3),
          radius: lightRadius * 0.75));
      canvas.drawCircle(Offset(centerX, centerY - bodyHeight / 3),
          lightRadius * 0.75, shimmerPaint);
    }

// Draw yellow light
    lightOnPaint.color =
        yellowOn ? FlexColor.amberLightPrimary : Colors.yellow.shade800;
    canvas.drawCircle(Offset(centerX, centerY), lightRadius,
        yellowOn ? lightOnPaint : lightOffPaint);
    if (yellowOn) {
      shimmerPaint.shader = RadialGradient(
        colors: <Color>[Colors.white, Colors.white.withOpacity(0.0)],
        stops: const <double>[0.0, 0.8],
      ).createShader(Rect.fromCircle(
          center: Offset(centerX, centerY), radius: lightRadius * 0.75));
      canvas.drawCircle(
          Offset(centerX, centerY), lightRadius * 0.75, shimmerPaint);
    }

// Draw green light
    lightOnPaint.color =
        greenOn ? FlexColor.moneyDarkPrimary : Colors.green.shade800;
    canvas.drawCircle(Offset(centerX, centerY + bodyHeight / 3), lightRadius,
        greenOn ? lightOnPaint : lightOffPaint);
    if (greenOn) {
      shimmerPaint.shader = RadialGradient(
        colors: <Color>[Colors.white, Colors.white.withOpacity(0.0)],
        stops: const <double>[0.0, 0.8],
      ).createShader(Rect.fromCircle(
          center: Offset(centerX, centerY + bodyHeight / 3),
          radius: lightRadius * 0.75));
      canvas.drawCircle(Offset(centerX, centerY + bodyHeight / 3),
          lightRadius * 0.75, shimmerPaint);
    }
  }

  @override
  bool shouldRepaint(TrafficLightPainter oldDelegate) {
    return oldDelegate.redOn != redOn ||
        oldDelegate.yellowOn != yellowOn ||
        oldDelegate.greenOn != greenOn;
  }
}
