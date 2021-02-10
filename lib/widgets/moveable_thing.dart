import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/screens/thing_screen.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';

class MoveableThing extends StatefulWidget {
  Thing thingCard;

  MoveableThing({this.thingCard});

  @override
  State<StatefulWidget> createState() {
    return _MoveableThingState();
  }
}

class _MoveableThingState extends State<MoveableThing> {
  double xPosition = 0;
  double yPosition = 0;
  Color color;

  @override
  void initState() {
    color = Colors.blue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: yPosition,
      left: xPosition,
      child: GestureDetector(
          onPanUpdate: (tapInfo) {
            setState(() {
              xPosition += tapInfo.delta.dx;
              yPosition += tapInfo.delta.dy;
            });
          },
          child: Hero(
            tag: widget.thingCard.information,
            child: ThingCard(thing: widget.thingCard),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ThingScreen()));
          }),
    );
  }
}
