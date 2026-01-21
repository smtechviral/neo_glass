import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuroraPainter extends CustomPainter {
  final double animation;
  final List<Color> colors;

  AuroraPainter({required this.animation, required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (int i = 0; i < 3; i++) {
      final path = Path();
      path.moveTo(0, size.height * 0.3);

      for (double x = 0; x <= size.width; x += 10) {
        final y = size.height * 0.3 +
            math.sin((x / size.width + animation + i * 0.3) * 4 * math.pi) *
                size.height *
                0.15;
        path.lineTo(x, y);
      }

      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.close();

      paint.shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          colors[i % colors.length].withOpacity(0.4),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(AuroraPainter oldDelegate) => true;
}

