import 'package:rhizome/rhizome.dart';
import 'mock_rhizome.dart';

class RhizomeManager {
  static Rhizome _rhizome;

  static Rhizome getInstance() {
    if (_rhizome == null) {
      _rhizome = mockRhizome();
    }
    return _rhizome;
  }
}
