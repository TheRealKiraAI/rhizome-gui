import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';
import '../models/rhizome_manager.dart';

class ThingScreen extends StatelessWidget {

  final String title = "Thing Screen";
  final Thing thing;
  final Rhizome rhizome = RhizomeManager.getInstance();

  ThingScreen({Key key, this.thing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final seekingThing = rhizome.seek(thing.information);
    final seekingTags = seekingThing.tags.map((uri) => rhizome.retrieve(uri));
    final seekingTargets = seekingThing.targets.map((uri) => rhizome.retrieve(uri));

    // FOR DEBUG
    debugPrint(thing, rhizome);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child: ListView.builder(
            itemCount: seekingTags.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: <Widget> [ tagAndTargets(seekingTags) ]
              );
            }
          ),
        ),
        Container(
          color: Colors.purple,
          height: 300,
          width: 300,
          child: ThingCard(thing: thing),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child: ListView.builder(
            itemCount: seekingTargets.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: <Widget> [ tagAndTargets(seekingTargets) ]
              );
            }
          ),
        ),
      ]),
    );
  }

  Widget tagAndTargets(Iterable<Thing> t) {
    return new Row(children: t.map((tagTarget) => ThingCard(thing: tagTarget)).toList());
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
