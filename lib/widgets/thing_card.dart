import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import '../screens/thing_card_screen.dart';

class ThingCard extends StatelessWidget {

  final Thing thing;
  final Offset offset;

  ThingCard({this.thing, this.offset});

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
                    thing: thing)))
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
