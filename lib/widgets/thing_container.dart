import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';
import '../models/rhizome_manager.dart';

class ThingContainer extends StatefulWidget {
  final Rhizome rhizome = RhizomeManager.getInstance();
  final Thing thing;
  final Image centerImage;
  List<Thing> tags;
  List<Thing> targets;

  ThingContainer({Key key, this.thing, this.centerImage}) : super(key: key) {
    tags = thing.tags.map((uri) => rhizome.retrieve(uri)).toList();
    targets = thing.targets.map((uri) => rhizome.retrieve(uri)).toList();
  }

  @override
  _ThingContainerState createState() => _ThingContainerState();
}

class _ThingContainerState extends State<ThingContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      _thingRow(widget.tags),
      _centerThingCard(widget.thing, widget.centerImage),
      _thingRow(widget.targets)
    ]);
  }

  // Widget _centerHeroCard(BuildContext context) {
  //   return GestureDetector(
  //     child: Center(
  //       child: Hero(
  //         tag: widget.thing.information,
  //         child: _centerThingCard(widget.thing),
  //         transitionOnUserGestures: true,
  //       ),
  //     ),
  //     onTap: () {
  //       Navigator.pop(context);
  //     },
  //   );
  // }

  Widget _centerThingCard(Thing thing, Image image) {
    return Container(
      color: Colors.blueGrey,
      //child: ThingCard(thing: thing, image: image),
      child: image,
    );
  }

  Widget _thingRow(List<Thing> things) {
    return Container(
      height: 175.0,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: things.map((thing) => ThingCard(thing: thing)).toList()),
    );
  }
}
