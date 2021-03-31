import 'package:rhizome/rhizome.dart';

/// Returns a Rhizome with some information in it to play with.
Rhizome mockRhizome() {
  final rhizome = Rhizome();

  // tags and targets
  final moabImage = rhizome.store('assets/images/moab.jpg');
  final moabText = rhizome.store('Moab');
  final utah = rhizome.store('Utah');
  final biking = rhizome.store('Mountain Biking');
  final arches = rhizome.store('Arches National Park');

  // people and places
  final joe = rhizome.store('assets/images/joe.jpeg');
  final sara = rhizome.store('assets/images/sara.jpeg');
  final zion = rhizome.store('assets/images/beautahful.jpeg');
  final archesImage = rhizome.store('assets/images/arches.jpeg');

  moabImage.tagWith(utah);
  moabImage.tagWith(biking);
  moabText.tagWith(arches);
  utah.tagWith(moabImage);
  arches.tagWith(moabImage);
  biking.tagWith(arches);
  biking.tagWith(utah);
  utah.tagWith(biking);
  utah.tagWith(moabImage);

  joe.tagWith(zion);
  zion.tagWith(joe);

  return rhizome;
}
