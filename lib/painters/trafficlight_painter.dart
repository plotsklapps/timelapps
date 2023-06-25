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

    // Center of the canvas
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    // Top-left position of the rectangle
    double rectStartX = centerX - 50; // Half the width
    double rectStartY = centerY - 150; // Half the height

    // Draw traffic light body with rounded corners
    canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(rectStartX, rectStartY, 100, 300),
          const Radius.circular(24),
        ),
        paint);

    // Shimmer effect for active light
    var shimmerPaint = Paint()
      ..shader = RadialGradient(
        colors: [Colors.white, Colors.white.withOpacity(0.0)],
        stops: const [0.0, 0.8],
      ).createShader(Rect.fromCircle(center: const Offset(50, 50), radius: 40));

    // Draw red light
    lightOnPaint.color = redOn ? Colors.red : Colors.red.shade800;
    canvas.drawCircle(Offset(centerX, centerY - 100), 40,
        redOn ? lightOnPaint : lightOffPaint);
    if (redOn) {
      canvas.drawCircle(Offset(centerX, centerY - 100), 30, shimmerPaint);
    }

    // Draw yellow light
    lightOnPaint.color = yellowOn ? Colors.yellow : Colors.yellow.shade800;
    canvas.drawCircle(
        Offset(centerX, centerY), 40, yellowOn ? lightOnPaint : lightOffPaint);
    if (yellowOn) {
      canvas.drawCircle(Offset(centerX, centerY), 30, shimmerPaint);
    }

    // Draw green light
    lightOnPaint.color = greenOn ? Colors.green : Colors.green.shade800;
    canvas.drawCircle(Offset(centerX, centerY + 100), 40,
        greenOn ? lightOnPaint : lightOffPaint);
    if (greenOn) {
      canvas.drawCircle(Offset(centerX, centerY + 100), 30, shimmerPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
