import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import '../screens/thing_card_screen.dart';

class ThingCard extends StatefulWidget {
  ThingCard({this.thing, this.rhizome, this.offset});

  final Thing thing;
  final Rhizome rhizome;
  Offset offset;

  @override
  _ThingCardState createState() => _ThingCardState();
}

class _ThingCardState extends State<ThingCard> {
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
                builder: (context) => ThingCardScreen(thing: widget.thing, rhizome: widget.rhizome)))
      },
      child: Card(
        color: Colors.lightBlueAccent,
        child: Center(
          child: Text(widget.thing.information),
        ),
      ),
    );
  }
}
