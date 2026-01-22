import 'package:flutter_test/flutter_test.dart';
import 'package:neo_glass/neo_glass.dart';

void main() {
  test('NeoGlassEffect enum has all values', () {
    expect(NeoGlassEffect.values.length, 6);
    expect(NeoGlassEffect.values, contains(NeoGlassEffect.morphism));
    expect(NeoGlassEffect.values, contains(NeoGlassEffect.holographic));
    expect(NeoGlassEffect.values, contains(NeoGlassEffect.plasma));
    expect(NeoGlassEffect.values, contains(NeoGlassEffect.crystal));
    expect(NeoGlassEffect.values, contains(NeoGlassEffect.aurora));
    expect(NeoGlassEffect.values, contains(NeoGlassEffect.quantum));
  });
}