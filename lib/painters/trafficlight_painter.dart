import 'package:timelapps/all_imports.dart';

class TrafficLightPainter extends CustomPainter {
  final bool redOn;
  final bool yellowOn;
  final bool greenOn;

  TrafficLightPainter({
    required this.redOn,
    required this.yellowOn,
    required this.greenOn,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.grey.shade800
      ..style = PaintingStyle.fill;

    var lightOnPaint = Paint()..style = PaintingStyle.fill;

    var lightOffPaint = Paint()
      ..color = Colors.grey.shade600
      ..style = PaintingStyle.fill;

    // Use a proportion of the size to define the dimensions of the lights and body
    double bodyWidth = size.width * 0.3;
    double bodyHeight = size.height * 0.9;
    double lightRadius = bodyWidth * 0.3;

    // Center of the canvas
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    // Top-left position of the rectangle
    double rectStartX = centerX - bodyWidth / 2;
    double rectStartY = centerY - bodyHeight / 2;

    // Draw traffic light body with rounded corners
    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(rectStartX, rectStartY, bodyWidth, bodyHeight),
          Radius.circular(bodyWidth * 0.24),
        ),
        paint);

    // Shimmer effect for active light
    var shimmerPaint = Paint()
      ..shader = RadialGradient(
        colors: [Colors.white, Colors.white.withOpacity(0.0)],
        stops: const [0.0, 0.8],
      ).createShader(Rect.fromCircle(
          center: Offset(centerX, centerY - bodyHeight / 3),
          radius: lightRadius));

    // Draw red light
    lightOnPaint.color = redOn ? Colors.red : Colors.red.shade800;
    canvas.drawCircle(Offset(centerX, centerY - bodyHeight / 3), lightRadius,
        redOn ? lightOnPaint : lightOffPaint);
    if (redOn) {
      shimmerPaint.shader = RadialGradient(
        colors: [Colors.white, Colors.white.withOpacity(0.0)],
        stops: const [0.0, 0.8],
      ).createShader(Rect.fromCircle(
          center: Offset(centerX, centerY - bodyHeight / 3),
          radius: lightRadius * 0.75));
      canvas.drawCircle(Offset(centerX, centerY - bodyHeight / 3),
          lightRadius * 0.75, shimmerPaint);
    }

// Draw yellow light
    lightOnPaint.color = yellowOn ? Colors.yellow : Colors.yellow.shade800;
    canvas.drawCircle(Offset(centerX, centerY), lightRadius,
        yellowOn ? lightOnPaint : lightOffPaint);
    if (yellowOn) {
      shimmerPaint.shader = RadialGradient(
        colors: [Colors.white, Colors.white.withOpacity(0.0)],
        stops: const [0.0, 0.8],
      ).createShader(Rect.fromCircle(
          center: Offset(centerX, centerY), radius: lightRadius * 0.75));
      canvas.drawCircle(
          Offset(centerX, centerY), lightRadius * 0.75, shimmerPaint);
    }

// Draw green light
    lightOnPaint.color = greenOn ? Colors.green : Colors.green.shade800;
    canvas.drawCircle(Offset(centerX, centerY + bodyHeight / 3), lightRadius,
        greenOn ? lightOnPaint : lightOffPaint);
    if (greenOn) {
      shimmerPaint.shader = RadialGradient(
        colors: [Colors.white, Colors.white.withOpacity(0.0)],
        stops: const [0.0, 0.8],
      ).createShader(Rect.fromCircle(
          center: Offset(centerX, centerY + bodyHeight / 3),
          radius: lightRadius * 0.75));
      canvas.drawCircle(Offset(centerX, centerY + bodyHeight / 3),
          lightRadius * 0.75, shimmerPaint);
    }
  }

  @override
  bool shouldRepaint(TrafficLightPainter oldDelegate) {
    // You might want to add more conditions here based on your actual requirements.
    return oldDelegate.redOn != redOn ||
        oldDelegate.yellowOn != yellowOn ||
        oldDelegate.greenOn != greenOn;
  }
}
