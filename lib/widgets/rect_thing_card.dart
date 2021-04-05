import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/utils/size_config.dart';

class RectThingCard extends StatefulWidget {
  final Thing thing;
  final bool image;
  final VoidCallback onDragged;

  RectThingCard({
    this.thing,
    this.image,
    this.onDragged,
    List<Thing> tags,
    List<Thing> targets,
  });

  @override
  _RectThingCardState createState() => _RectThingCardState();
}

class _RectThingCardState extends State<RectThingCard> {
  @override
  Widget build(BuildContext context) {
    bool accepted = false;

    return LongPressDraggable<dynamic>(
      data: widget.thing,
      child: _thingContainer(accepted),
      childWhenDragging: Container(
        width: SizeConfig.blockSizeHorizontal * 5,
        height: SizeConfig.blockSizeVertical * 5,
        color: Colors.blueGrey,
        child: _thingContainer(accepted),
      ),
      onDragCompleted: widget.onDragged,
      feedback: Container(
        width: SizeConfig.blockSizeHorizontal * 5,
        height: SizeConfig.blockSizeVertical * 5,
        color: Colors.blueGrey,
        child: _thingContainer(accepted),
      ),
    );
  }

  Widget _thingContainer(bool accepted) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DragTarget<dynamic>(
            onWillAccept: (dynamic d) => true,
            onAccept: (dynamic d) {
              widget.thing.tagWith(d);
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                  width: SizeConfig.blockSizeHorizontal * 5,
                  height: SizeConfig.blockSizeVertical * 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: AssetImage(widget.thing.information),
                        fit: BoxFit.fill),
                  ));
            }),
      ],
    );
  }
}
