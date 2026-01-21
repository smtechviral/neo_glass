import 'package:flutter/material.dart';
import 'src/enums.dart';
import 'src/neo_glass_container.dart';

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
      home: const GlassShowcaseScreen(),
    );
  }
}

class GlassShowcaseScreen extends StatelessWidget {
  const GlassShowcaseScreen({super.key});

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
                  'Next-gen glass morphism',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withValues(alpha:0.7),
                  ),
                ),
                const SizedBox(height: 40),

                // Morphism Effect
                _buildEffectCard(
                  effect: NeoGlassEffect.morphism,
                  title: 'Liquid Morphism',
                  subtitle: 'Smooth liquid glass with animated gradient',
                  icon: Icons.water_drop,
                  color: Colors.blue,
                ),
                const SizedBox(height: 24),

                // Holographic Effect
                _buildEffectCard(
                  effect: NeoGlassEffect.holographic,
                  title: 'Holographic',
                  subtitle: 'Rainbow shimmer with rotating gradient',
                  icon: Icons.auto_awesome,
                  color: Colors.pink,
                ),
                const SizedBox(height: 24),

                // Plasma Effect
                _buildEffectCard(
                  effect: NeoGlassEffect.plasma,
                  title: 'Plasma Glow',
                  subtitle: 'Energetic plasma with glow effect',
                  icon: Icons.blur_circular,
                  color: Colors.purple,
                ),
                const SizedBox(height: 24),

                // Crystal Effect
                _buildEffectCard(
                  effect: NeoGlassEffect.crystal,
                  title: 'Crystal Refraction',
                  subtitle: 'Diamond-like crystal facets',
                  icon: Icons.diamond,
                  color: Colors.cyan,
                ),
                const SizedBox(height: 24),

                // Aurora Effect
                _buildEffectCard(
                  effect: NeoGlassEffect.aurora,
                  title: 'Aurora Borealis',
                  subtitle: 'Northern lights wave animation',
                  icon: Icons.nightlight,
                  color: Colors.green,
                ),
                const SizedBox(height: 24),

                // Quantum Effect
                _buildEffectCard(
                  effect: NeoGlassEffect.quantum,
                  title: 'Quantum Blur',
                  subtitle: 'Multi-layer blur with particles',
                  icon: Icons.scatter_plot,
                  color: Colors.teal,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEffectCard({
    required NeoGlassEffect effect,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return NeoGlassContainer(
      effect: effect,
      accentColor: color,
      intensity: 1.0,
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withValues(alpha:0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: Colors.white, size: 32),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withValues(alpha:0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
