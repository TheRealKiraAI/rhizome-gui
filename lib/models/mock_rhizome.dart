import 'package:rhizome/rhizome.dart';

/// Returns a Rhizome with some information in it to play with.
Rhizome mockRhizome() {
  final rhizome = Rhizome();

  final f1 = rhizome.store('Formula 1');
  final motorsport = rhizome.store('Motorsport');
  final hamilton = rhizome.store('Lewis Hamilton');
  final senna = rhizome.store('Ayrton Senna');

  f1.tagWith(motorsport);
  motorsport.tagWith(f1);
  hamilton.tagWith(senna);
  hamilton.tagWith(f1);
  senna.tagWith(hamilton);
  senna.tagWith(f1);

  return rhizome;
}
