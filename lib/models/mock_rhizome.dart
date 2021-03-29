import 'package:rhizome/rhizome.dart';

/// Returns a Rhizome with some information in it to play with.
Rhizome mockRhizome() {
  final rhizome = Rhizome();

  final moabImage = rhizome.store('assets/images/moab.jpg');
  final moabText = rhizome.store('Moab');
  final utah = rhizome.store('Utah');
  final biking = rhizome.store('Mountain Biking');
  final arches = rhizome.store('Arches National Park');

  moabImage.tagWith(utah);
  moabImage.tagWith(biking);
  moabText.tagWith(arches);
  utah.tagWith(moabImage);
  biking.tagWith(arches);
  biking.tagWith(utah);
  utah.tagWith(biking);
  utah.tagWith(moabImage);

  return rhizome;
}
