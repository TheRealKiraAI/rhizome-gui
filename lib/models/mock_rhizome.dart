import 'package:rhizome/rhizome.dart';

/// Returns a Rhizome with some information in it to play with.
Rhizome mockRhizome() {
  final rhizome = Rhizome();

  final moab = rhizome.store('Moab');
  final utah = rhizome.store('Utah');
  final biking = rhizome.store('Mountain Biking');
  final arches = rhizome.store('Arches National Park');

  moab.tagWith(utah);
  moab.tagWith(biking);
  utah.tagWith(moab);
  biking.tagWith(arches);
  biking.tagWith(utah);
  utah.tagWith(biking);
  utah.tagWith(moab);

  return rhizome;
}
