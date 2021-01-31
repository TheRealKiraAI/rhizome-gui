import 'package:flutter_test/flutter_test.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/models/rhizome_manager.dart';

void main() {
  test('getInstance() returns the singleton Rhizome', () {
    Rhizome rhizome = RhizomeManager.getInstance();
    expect(rhizome, RhizomeManager.getInstance());
  });
}
