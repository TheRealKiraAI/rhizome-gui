import 'package:rhizome/rhizome.dart';
import 'mock_rhizome.dart';

class RhizomeManager {
  static RhizomeManager _instance;
  final Rhizome rhizome;

  RhizomeManager._({Rhizome rhizome}) : this.rhizome = rhizome;

  factory RhizomeManager.getInstance() {
    assert(_instance != null);
    return _instance;
  }

  static initialize() {
    _instance = RhizomeManager._(rhizome: mockRhizome());
  }
}
