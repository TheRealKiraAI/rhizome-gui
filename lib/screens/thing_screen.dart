import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';
import '../models/rhizome_manager.dart';

class ThingScreen extends StatelessWidget {
  final String title = "Thing Screen";
  final Thing thing;
  final Rhizome rhizome = RhizomeManager.getInstance();
  List<Thing> tags;
  List<Thing> targets;

  ThingScreen({Key key, this.thing}) : super(key: key) {
    tags = thing.tags.map((uri) => rhizome.retrieve(uri)).toList();
    targets = thing.targets.map((uri) => rhizome.retrieve(uri)).toList();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(thing, rhizome);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(children: [
        _thingRow(tags),
        GestureDetector(
          child: Hero(
            tag: thing.information,
            child: _centerThingCard(thing),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        _thingRow(targets),
      ]),
    );
  }

  Widget _centerThingCard(Thing thing) {
    return Container(
      color: Colors.purple,
      height: 300,
      width: 300,
      child: ThingCard(thing: thing),
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

  void debugPrint(Thing thing, Rhizome rhizome) {
    print('Focusing on thing...');
    final seekingThing = rhizome.seek(thing.information);
    print(seekingThing.information);
    print('Tags:');
    final seekingTags = seekingThing.tags.map((uri) => rhizome.retrieve(uri));
    seekingTags.forEach((tag) => print(tag.information));
    print('Targets:');
    final motorsportTargets =
        seekingThing.targets.map((uri) => rhizome.retrieve(uri));
    motorsportTargets.forEach((tag) => print(tag.information));
  }
}
