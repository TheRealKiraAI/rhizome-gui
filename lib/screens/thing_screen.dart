import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';
import '../models/rhizome_manager.dart';

class ThingScreen extends StatelessWidget {
  final String title = "Thing Screen";
  final Thing thing;
  final Uri uri;
  final Rhizome rhizome = RhizomeManager.getInstance();
  List<Thing> tags;
  List<Thing> targets;

  static const routeName = '/thing_screen';

  ThingScreen({Key key, this.thing, this.uri}) : super(key: key) {
    tags = thing.tags.map((uri) => rhizome.retrieve(uri)).toList();
    targets = thing.targets.map((uri) => rhizome.retrieve(uri)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InteractiveViewer(
        panEnabled: true,
        onInteractionUpdate: (ScaleUpdateDetails details) {
          var myScale = details.scale;
          if (myScale <= 2.0) {
            Navigator.of(context).pop();
          }
          print(myScale);
        },
        boundaryMargin: EdgeInsets.all(80),
        minScale: 0.5,
        maxScale: 4,
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            _thingRow(tags),
            _centerHeroCard(context),
            _thingRow(targets),
          ]),
        ),
      ),
    );
  }

  Widget _centerHeroCard(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Hero(
          tag: thing.information,
          child: _centerThingCard(thing),
          transitionOnUserGestures: true,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
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
}
