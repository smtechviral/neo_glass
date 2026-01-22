import 'package:flutter/material.dart';
import 'package:neo_glass/neo_glass.dart';

void main() {
  runApp(const NeoGlassExampleApp());
}

class NeoGlassExampleApp extends StatelessWidget {
  const NeoGlassExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const ShowcaseScreen(),
    );
  }
}

class ShowcaseScreen extends StatelessWidget {
  const ShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0F0C29),
              Color(0xFF302B63),
              Color(0xFF24243E),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  '✨ Neo Glass Effects',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Revolutionary glassmorphism package',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: 40),

                // Grid of all effects
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.85,
                  children: [
                    _buildCompactCard(
                      effect: NeoGlassEffect.morphism,
                      title: 'Liquid\nMorphism',
                      icon: Icons.water_drop,
                      color: Colors.blue,
                    ),
                    _buildCompactCard(
                      effect: NeoGlassEffect.holographic,
                      title: 'Holographic',
                      icon: Icons.auto_awesome,
                      color: Colors.pink,
                    ),
                    _buildCompactCard(
                      effect: NeoGlassEffect.plasma,
                      title: 'Plasma\nGlow',
                      icon: Icons.blur_circular,
                      color: Colors.purple,
                    ),
                    _buildCompactCard(
                      effect: NeoGlassEffect.crystal,
                      title: 'Crystal\nRefraction',
                      icon: Icons.diamond,
                      color: Colors.cyan,
                    ),
                    _buildCompactCard(
                      effect: NeoGlassEffect.aurora,
                      title: 'Aurora\nBorealis',
                      icon: Icons.nightlight,
                      color: Colors.green,
                    ),
                    _buildCompactCard(
                      effect: NeoGlassEffect.quantum,
                      title: 'Quantum\nBlur',
                      icon: Icons.scatter_plot,
                      color: Colors.teal,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompactCard({
    required NeoGlassEffect effect,
    required String title,
    required IconData icon,
    required Color color,
  }) {
    return NeoGlassContainer(
      effect: effect,
      accentColor: color,
      intensity: 1.0,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 40),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}