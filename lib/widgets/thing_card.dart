import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import '../pages/thing_card_page.dart';

class ThingCard extends StatelessWidget {
  final Thing thing;

  ThingCard({this.thing});

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
                builder: (context) => ThingCardPage(thing: thing)))
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
