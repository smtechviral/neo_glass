import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuantumPainter extends CustomPainter {
  final double animation;
  final Color color;

  QuantumPainter({required this.animation, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Draw quantum particles
    for (int i = 0; i < 20; i++) {
      final x = (math.cos(animation * 2 * math.pi + i * 0.3) * 0.5 + 0.5) *
          size.width;
      final y = (math.sin(animation * 2 * math.pi + i * 0.5) * 0.5 + 0.5) *
          size.height;
      final radius = 2 + math.sin(animation * 4 * math.pi + i) * 1.5;

      paint.color = color.withValues(alpha:0.6);
      canvas.drawCircle(Offset(x, y), radius, paint);

      // Glow effect
      paint.shader = RadialGradient(
        colors: [
          color.withValues(alpha:0.3),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: Offset(x, y), radius: radius * 3));
      canvas.drawCircle(Offset(x, y), radius * 3, paint);
      paint.shader = null;
    }
  }

  @override
  bool shouldRepaint(QuantumPainter oldDelegate) => true;
}

