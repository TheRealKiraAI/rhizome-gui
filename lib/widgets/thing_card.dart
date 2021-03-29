import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';

class ThingCard extends StatefulWidget {
  final Thing thing;

  ThingCard(
      {this.thing,
      List<Thing> tags,
      List<Thing> targets,
      });

  @override
  _ThingCardState createState() => _ThingCardState();
}

class _ThingCardState extends State<ThingCard> {
  @override
  Widget build(BuildContext context) {
    bool accepted = false;

    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.deepOrange),
      ),
      // onPressed: () => {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => ThingContainer(thing: widget.thing)))
      // },
      child: LongPressDraggable<Thing>(
        data: widget.thing,
        child: _thingContainer(accepted),
        childWhenDragging: Container(
          width: 150,
          height: 150,
          color: Colors.blueGrey,
          child: _thingContainer(accepted),
        ),
        feedback: Container(
          width: 150,
          height: 150,
          color: Colors.blueGrey,
          child: _thingContainer(accepted),
        ),
      ),
    );
  }

  Widget _thingContainer(bool accepted) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DragTarget<Thing>(
            onWillAccept: (Thing d) => true,
            onAccept: (Thing d) {
              widget.thing.tagWith(d);
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                width: 150,
                height: 150,
                child: Card(
                  color: Colors.lightBlueAccent,
                  child: Center(
                    child: Text(widget.thing.information),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
