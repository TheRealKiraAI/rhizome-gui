import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/models/rhizome_manager.dart';
import 'package:rhizome_gui/widgets/moveable_thing.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';
import 'package:rhizome_gui/widgets/thing_container.dart';

class ThingWorld extends StatefulWidget {
  final Rhizome rhizome = RhizomeManager.getInstance();
  GlobalKey<NavigatorState> globalKey;
  final List<MoveableThing> moveableThing;
  final List<ThingContainer> list;
  List<Thing> tags;
  List<Thing> targets;

  ThingWorld({Key key, this.globalKey, this.moveableThing, this.list})
      : super(key: key) {}

  _ThingWorldState createState() => _ThingWorldState();
}

class _ThingWorldState extends State<ThingWorld> {
  bool _active = false;
  String velocity;
  TransformationController controller = TransformationController();

  void Function(ScaleUpdateDetails) _handleZoom() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    Thing thing = widget.rhizome.store('thing');
    //tags = thing.tags.map((uri) => rhizome.retrieve(uri)).toList();
    //targets = thing.targets.map((uri) => rhizome.retrieve(uri)).toList();
    return Container(
      child: InteractiveViewer(
      panEnabled: true,
      boundaryMargin: EdgeInsets.all(double.infinity),
      minScale: 0.1,
      maxScale: 4,
      transformationController: controller,
      onInteractionEnd: (ScaleEndDetails endDetails) {
        print(endDetails);
        print(endDetails.velocity);
        controller.value = Matrix4.identity();
        setState(() {
          velocity = endDetails.velocity.toString();
        });
      },
      child: ThingContainer(thing: thing)));
      //child: Column(children: _thingCards(widget.rhizome)),
    }

  List<MoveableThing> _thingCards(Rhizome rhizome) {
    return rhizome
        .query()
        .map((thing) => MoveableThing(
            globalKey: widget.globalKey, thingCard: ThingCard(thing: thing)))
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
