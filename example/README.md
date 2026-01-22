# Neo Glass Example

## 📘 Complete Example

A full runnable example app is available on GitHub:

👉 **[example/lib/main.dart](https://github.com/smtechviral/neo_glass/blob/main/example/lib/main.dart)**

This example demonstrates all 6 Neo Glass effects with animations and configurations.
## Running the example
```bash
cd example
flutter pub get
flutter run
```

## Features Demonstrated

- ✨ **Liquid Morphism** - Animated liquid gradient through glass
- 🌈 **Holographic** - Rainbow shimmer with rotating gradient
- ⚡ **Plasma Glow** - Energetic plasma with glow effect
- 💎 **Crystal Refraction** - Diamond-like crystal facets
- 🌌 **Aurora Borealis** - Northern lights wave animation
- ⚛️ **Quantum Blur** - Multi-layer blur with particles

## Usage Examples

### Basic Usage
```dart
NeoGlassContainer(
  effect: NeoGlassEffect.morphism,
  child: Text('Hello Neo Glass!'),
)
```

### Advanced Customization
```dart
NeoGlassContainer(
  effect: NeoGlassEffect.holographic,
  accentColor: Colors.purple,
  intensity: 1.5,
  borderRadius: 32,
  padding: EdgeInsets.all(24),
  animate: true,
  animationDuration: Duration(seconds: 4),
  child: YourWidget(),
)
```

### Custom Colors
```dart
NeoGlassContainer(
  effect: NeoGlassEffect.aurora,
  customColors: [
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
  ],
  child: YourWidget(),
)
```
```
