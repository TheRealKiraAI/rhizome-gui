import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/models/rhizome_manager.dart';
import 'package:rhizome_gui/widgets/moveable_thing.dart';
import 'package:rhizome_gui/widgets/thing_container.dart';

class ThingWorld extends StatelessWidget {
  final List<MoveableThing> stack;
  final Rhizome rhizome = RhizomeManager.getInstance();

  ThingWorld({Key key, this.stack});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InteractiveViewer(
        panEnabled: true,
        boundaryMargin: EdgeInsets.all(double.infinity),
        minScale: 0.1,
        maxScale: 4,
        onInteractionUpdate: (ScaleUpdateDetails details) {
          var myScale = details.scale;
          if (myScale >= 1.5) {
            print('>= 1.5');
          }

          if (myScale <= 0.8) {
            print('<= 0.8');
          }
          print(myScale);
        },
        // child: Container(
        //   child: ThingContainer(thing: rhizome.store('test')),
        // ),
        child: IndexedStack(
          index: 0,
          children: _thingCards(rhizome)
        )
      ),
    );
  }

  List<ThingContainer> _thingCards(Rhizome rhizome) {
    return rhizome
        .query()
        .map((thing) => ThingContainer(thing: thing))
        .toList();
  }
}
