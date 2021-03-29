import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';

class ThingCard extends StatefulWidget {
  final Thing thing;
  final VoidCallback onDragged;

  ThingCard({
    this.thing,
    this.onDragged,
    List<Thing> tags,
    List<Thing> targets,
  });

  @override
  _ThingCardState createState() => _ThingCardState();
}

class _ThingCardState extends State<ThingCard> {
  Image thingImage;
  bool isImage = false;

  bool _defineImage(Thing thing) {
    if (thing.information.contains('assets')) {
      setState(() {
        isImage = true;
      });
    } else {
      setState(() {
        isImage = false;
      });
    }
    return isImage;
  }

  @override
  Widget build(BuildContext context) {
    bool accepted = false;
    bool image = _defineImage(widget.thing);

    return LongPressDraggable<dynamic>(
      data: widget.thing,
      child: _thingContainer(accepted, image),
      childWhenDragging: Container(
        width: 150,
        height: 150,
        color: Colors.blueGrey,
        child: _thingContainer(accepted, image),
      ),
      onDragCompleted: widget.onDragged,
      feedback: Container(
        width: 150,
        height: 150,
        color: Colors.blueGrey,
        child: _thingContainer(accepted, image),
      ),
    );
  }

  Widget _thingContainer(bool accepted, bool image) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DragTarget<dynamic>(
            onWillAccept: (dynamic d) => true,
            onAccept: (dynamic d) {
              widget.thing.tagWith(d);
            },
            builder: (context, candidateData, rejectedData) {
              return image
                  ? Container(
                    width: 150,
                    height: 150,
                      decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(widget.thing.information), fit: BoxFit.fill),
                      )
                  )
                  : Container(
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
