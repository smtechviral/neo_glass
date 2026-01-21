import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrystalPainter extends CustomPainter {
  final double animation;
  final double intensity;

  CrystalPainter({required this.animation, required this.intensity});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // Draw crystal facets
    for (int i = 0; i < 8; i++) {
      final angle = (i / 8) * 2 * math.pi + animation * 2 * math.pi;
      final startX = size.width / 2 + math.cos(angle) * size.width * 0.3;
      final startY = size.height / 2 + math.sin(angle) * size.height * 0.3;
      final endX =
          size.width / 2 + math.cos(angle + math.pi) * size.width * 0.2;
      final endY =
          size.height / 2 + math.sin(angle + math.pi) * size.height * 0.2;

      paint.color = Colors.white.withOpacity(0.3 * intensity);
      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
    }
  }

  @override
  bool shouldRepaint(CrystalPainter oldDelegate) => true;
}

