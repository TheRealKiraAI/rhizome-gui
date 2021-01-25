import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import '../screens/thing_card_screen.dart';

class ThingCard extends StatelessWidget {
  final Thing thing;
  final Rhizome rhizome;

  ThingCard({this.thing, this.rhizome});

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
                builder: (context) => ThingCardScreen(thing: thing, rhizome: rhizome)))
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
