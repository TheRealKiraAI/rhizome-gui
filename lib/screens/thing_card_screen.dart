import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';

class ThingCardScreen extends StatelessWidget {
  ThingCardScreen({Key key, this.thing, this.rhizome}) : super(key: key);

  final String title = "Thing Screen";
  final Thing thing;
  final Rhizome rhizome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: thingCardDetail(thing, rhizome),
    );
  }
}

Widget thingCardDetail(Thing thing, Rhizome rhizome) {
  final seekingThing = rhizome.seek(thing.information);
  final seekingTags = seekingThing.tags.map((uri) => rhizome.retrieve(uri));
  final seekingTargets = seekingThing.targets.map((uri) => rhizome.retrieve(uri));

  // FOR DEBUG
  debugPrint(thing, rhizome);

  return Card(
    color: Colors.lightGreenAccent,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Text('Focusing on thing...'),
          Text(seekingThing.information),
          Text('Tags: '),
          getTagWidgets(seekingTags),
          Text('Targets: '),
          getTargetWidgets(seekingTargets),
        ],
      ),
    ),
  );
}

Widget getTagWidgets(Iterable<Thing> tags) {
  return new Column(children: tags.map((tag) => new Text(tag.information)).toList());
}

Widget getTargetWidgets(Iterable<Thing> targets) {
  return new Column(children: targets.map((target) => new Text(target.information)).toList());
}

void debugPrint(Thing thing, Rhizome rhizome) {
  print('Focusing on thing...');
  final seekingThing = rhizome.seek(thing.information);
  print(seekingThing.information);
  print('Tags:');
  final seekingTags = seekingThing.tags.map((uri) => rhizome.retrieve(uri));
  seekingTags.forEach((tag) => print(tag.information));
  print('Targets:');
  final motorsportTargets = seekingThing.targets.map((uri) => rhizome.retrieve(uri));
  motorsportTargets.forEach((tag) => print(tag.information));
}
