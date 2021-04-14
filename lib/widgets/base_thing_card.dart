import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/utils/size_config.dart';

class BaseThingCard extends StatefulWidget {
  final Thing thing;
  final bool image;
  final VoidCallback onDragged;

  BaseThingCard({
    this.thing,
    this.image,
    this.onDragged,
    List<Thing> tags,
    List<Thing> targets,
  });

  @override
  _BaseThingCardState createState() => _BaseThingCardState();
}

class _BaseThingCardState extends State<BaseThingCard> {
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

    return Draggable<dynamic>(
      data: widget.thing,
      child: _thingContainer(accepted, image),
      childWhenDragging: Container(
        height: SizeConfig.blockSizeVertical * 20,
        width: SizeConfig.blockSizeHorizontal * 25,
        color: Colors.blueGrey,
        child: _thingContainer(accepted, image),
      ),
      onDragCompleted: widget.onDragged,
      feedback: Container(
        height: SizeConfig.blockSizeVertical * 20,
        width: SizeConfig.blockSizeHorizontal * 25,
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
                      height: SizeConfig.blockSizeVertical * 10,
                      width: SizeConfig.blockSizeHorizontal * 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(widget.thing.information),
                            fit: BoxFit.fill),
                      ))
                  : Container(
                      height: SizeConfig.blockSizeVertical * 10,
                      width: SizeConfig.blockSizeHorizontal * 15,
                      child: Card(
                        color: Colors.lightBlueAccent,
                        child: Center(
                          child: Text(widget.thing.information, textAlign: TextAlign.center),
                        ),
                      ),
                    );
            }),
      ],
    );
  }
}
