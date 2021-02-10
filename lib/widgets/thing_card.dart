import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import '../screens/thing_screen.dart';

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
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ThingScreen(thing: thing)))
      },
      child: DragTarget(
        builder: (context, List<Thing> candidateData, rejectedData) {
          return Container(
            width: 150,
            height: 150,
            child: Card(
              color: Colors.lightBlueAccent,
              child: Center(
                child: Text(thing.information),
              ),
            ),
          );
        },
        onWillAccept: (data) {
          return true;
        },
        onAccept: (data) {
          print('accept');
        },
      ),
    );
  }
}
