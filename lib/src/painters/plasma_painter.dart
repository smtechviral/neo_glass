import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlasmaPainter extends CustomPainter {
  final double animation;
  final double intensity;
  final Color color;

  PlasmaPainter({
    required this.animation,
    required this.intensity,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (int i = 0; i < 5; i++) {
      final offset = Offset(
        size.width / 2 +
            math.cos(animation * 2 * math.pi + i) * size.width * 0.3,
        size.height / 2 +
            math.sin(animation * 2 * math.pi + i) * size.height * 0.3,
      );

      paint.shader = RadialGradient(
        colors: [
          color.withValues(alpha: 0.4 * intensity),
          color.withValues(alpha: 0.2 * intensity),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: offset, radius: size.width * 0.4));

      canvas.drawCircle(offset, size.width * 0.4, paint);
    }
  }

  @override
  bool shouldRepaint(PlasmaPainter oldDelegate) => true;
}

