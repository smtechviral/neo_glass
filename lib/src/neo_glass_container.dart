import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'enums.dart';

class NeoGlassContainer extends StatefulWidget {
  final double? width;
  final double? height;
  final Widget? child;
  final NeoGlassEffect effect;
  final double intensity;
  final Color? accentColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;
  final bool animate;
  final Duration animationDuration;
  final List<Color>? customColors;

  const NeoGlassContainer({
    super.key,
    this.width,
    this.height,
    this.child,
    this.effect = NeoGlassEffect.morphism,
    this.intensity = 1.0,
    this.accentColor,
    this.padding,
    this.margin,
    this.borderRadius = 24,
    this.animate = true,
    this.animationDuration = const Duration(seconds: 3),
    this.customColors,
  });

  @override
  State<NeoGlassContainer> createState() => _NeoGlassContainerState();
}

class _NeoGlassContainerState extends State<NeoGlassContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    if (widget.animate) {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return _buildEffect();
        },
      ),
    );
  }

  Widget _buildEffect() {
    switch (widget.effect) {
      case NeoGlassEffect.morphism:
        return _buildMorphism();
      case NeoGlassEffect.holographic:
        return _buildHolographic();
      case NeoGlassEffect.plasma:
        return _buildPlasma();
      case NeoGlassEffect.crystal:
        return _buildCrystal();
      case NeoGlassEffect.aurora:
        return _buildAurora();
      case NeoGlassEffect.quantum:
        return _buildQuantum();
    }
  }

  // Liquid Morphism Effect
  Widget _buildMorphism() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20 * widget.intensity,
              sigmaY: 20 * widget.intensity,
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.2 * widget.intensity),
                    Colors.white.withOpacity(0.05 * widget.intensity),
                  ],
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
            ),
          ),
          // Animated liquid gradient overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(
                    math.cos(_controller.value * 2 * math.pi) * 0.5,
                    math.sin(_controller.value * 2 * math.pi) * 0.5,
                  ),
                  radius: 1.5,
                  colors: [
                    (widget.accentColor ?? Colors.blue).withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
            ),
          ),
          // Border glow
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1.5,
              ),
            ),
            padding: widget.padding ?? const EdgeInsets.all(20),
            child: widget.child,
          ),
        ],
      ),
    );
  }

  // Holographic Shimmer Effect
  Widget _buildHolographic() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
            ),
          ),
          // Holographic gradient
          Positioned.fill(
            child: Transform.rotate(
              angle: _controller.value * 2 * math.pi,
              child: Container(
                decoration: BoxDecoration(
                  gradient: SweepGradient(
                    center: Alignment.center,
                    colors: widget.customColors ??
                        [
                          Colors.pink.withOpacity(0.3),
                          Colors.purple.withOpacity(0.3),
                          Colors.blue.withOpacity(0.3),
                          Colors.cyan.withOpacity(0.3),
                          Colors.pink.withOpacity(0.3),
                        ],
                  ),
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
              ),
            ),
          ),
          // Frosted overlay
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: Border.all(
                  color: Colors.white.withOpacity(0.4),
                  width: 2,
                ),
              ),
              padding: widget.padding ?? const EdgeInsets.all(20),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }

  // Plasma Glow Effect
  Widget _buildPlasma() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: Stack(
        children: [
          // Plasma background
          Positioned.fill(
            child: CustomPaint(
              painter: PlasmaPainter(
                animation: _controller.value,
                intensity: widget.intensity,
                color: widget.accentColor ?? Colors.purple,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Colors.white.withOpacity(0.15),
                    Colors.white.withOpacity(0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: Border.all(
                  color: (widget.accentColor ?? Colors.purple).withOpacity(0.5),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color:
                        (widget.accentColor ?? Colors.purple).withOpacity(0.3),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
              ),
              padding: widget.padding ?? const EdgeInsets.all(20),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }

  // Crystal Refraction Effect
  Widget _buildCrystal() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
            ),
          ),
          // Crystal facets
          Positioned.fill(
            child: CustomPaint(
              painter: CrystalPainter(
                animation: _controller.value,
                intensity: widget.intensity,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.25),
                    Colors.white.withOpacity(0.05),
                    Colors.blue.withOpacity(0.15),
                  ],
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: Border.all(
                  color: Colors.white.withOpacity(0.5),
                  width: 2,
                ),
              ),
              padding: widget.padding ?? const EdgeInsets.all(20),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }

  // Aurora Borealis Effect
  Widget _buildAurora() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: Stack(
        children: [
          // Aurora waves
          Positioned.fill(
            child: CustomPaint(
              painter: AuroraPainter(
                animation: _controller.value,
                colors: widget.customColors ??
                    [
                      Colors.green,
                      Colors.blue,
                      Colors.purple,
                      Colors.pink,
                    ],
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withValues(alpha: 0.3),
                    Colors.white.withOpacity(0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1.5,
                ),
              ),
              padding: widget.padding ?? const EdgeInsets.all(20),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }

  // Quantum Blur Effect
  Widget _buildQuantum() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: Stack(
        children: [
          // Multi-layer blur
          for (int i = 0; i < 3; i++)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.0 + (i * 10),
                  sigmaY: 10.0 + (i * 10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(
                        math.cos(_controller.value * 2 * math.pi + i) * 0.3,
                        math.sin(_controller.value * 2 * math.pi + i) * 0.3,
                      ),
                      colors: [
                        Colors.white.withOpacity(0.15 / (i + 1)),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          // Quantum particles
          Positioned.fill(
            child: CustomPaint(
              painter: QuantumPainter(
                animation: _controller.value,
                color: widget.accentColor ?? Colors.cyan,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: Border.all(
                color: (widget.accentColor ?? Colors.cyan).withOpacity(0.5),
                width: 2,
              ),
            ),
            padding: widget.padding ?? const EdgeInsets.all(20),
            child: widget.child,
          ),
        ],
      ),
    );
  }
}

// ============= CUSTOM PAINTERS =============

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
          color.withOpacity(0.4 * intensity),
          color.withOpacity(0.2 * intensity),
          Colors.transparent,
        ],
      ).createShader(Rect.fromCircle(center: offset, radius: size.width * 0.4));

      canvas.drawCircle(offset, size.width * 0.4, paint);
    }
  }

  @override
  bool shouldRepaint(PlasmaPainter oldDelegate) => true;
}

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

      paint.color = color.withOpacity(0.6);
      canvas.drawCircle(Offset(x, y), radius, paint);

      // Glow effect
      paint.shader = RadialGradient(
        colors: [
          color.withOpacity(0.3),
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
