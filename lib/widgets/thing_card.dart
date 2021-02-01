import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/models/rhizome_manager.dart';
import '../screens/thing_card_screen.dart';

class ThingCard extends StatelessWidget {
  ThingCard({this.thing, this.offset});

  final Thing thing;
  final Rhizome rhizome = RhizomeManager.getInstance();
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.deepOrange),
      ),
      onPressed: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ThingCardScreen(
                    thing: thing, rhizome: rhizome)))
      },
      child: Card(
        color: Colors.lightBlueAccent,
        child: Center(
          child: Text(thing.information),
        ),
      ),
    );
  }
}
