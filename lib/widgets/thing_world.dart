import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/models/rhizome_manager.dart';
import 'package:rhizome_gui/widgets/moveable_thing.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';
import 'package:rhizome_gui/widgets/thing_container.dart';

class ThingWorld extends StatelessWidget {
  final Rhizome rhizome = RhizomeManager.getInstance();
  GlobalKey<NavigatorState> globalKey;
  final List<MoveableThing> moveableThing;
  final List<ThingContainer> list;
  List<Thing> tags;
  List<Thing> targets;

  ThingWorld({Key key, this.globalKey, this.moveableThing, this.list})
      : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    //tags = thing.tags.map((uri) => rhizome.retrieve(uri)).toList();
    //targets = thing.targets.map((uri) => rhizome.retrieve(uri)).toList();
    return Container(
      child: InteractiveViewer(
          panEnabled: true,
          boundaryMargin: EdgeInsets.all(double.infinity),
          minScale: 0.1,
          maxScale: 4,
          onInteractionUpdate: (ScaleUpdateDetails details) {
            var myScale = details.scale;
            if (myScale >= 1.5) {
              print('>= 1.5 world');
              Thing thing = rhizome.store('thing');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ThingContainer(thing: thing)));
            }

            if (myScale <= 0.8) {
              print('<= 0.8');
            }
            print(myScale);
          },
          // child: Column(
          //   children: _thingCards(rhizome)
          // ),
          //),
          child: IndexedStack(index: 0, children: _thingCards(rhizome))),
    );
  }

  List<MoveableThing> _thingCards(Rhizome rhizome) {
    return rhizome
        .query()
        .map((thing) => MoveableThing(
            globalKey: globalKey, thingCard: ThingCard(thing: thing)))
        .toList();
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
