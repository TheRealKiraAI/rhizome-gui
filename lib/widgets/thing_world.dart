import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/models/rhizome_manager.dart';
import 'package:rhizome_gui/widgets/moveable_thing.dart';
import 'package:rhizome_gui/widgets/test_container.dart';
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
  String velocity = "velocity";
  String scale = "scale";
  TransformationController controller = TransformationController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Expanded(
          child: InteractiveViewer(
              panEnabled: true,
              boundaryMargin: EdgeInsets.all(double.infinity),
              minScale: 0.1,
              maxScale: 4,
              transformationController: controller,
              onInteractionUpdate: (ScaleUpdateDetails updateDetails) {
                setState(() {
                  scale = updateDetails.scale.toString();
                  if (updateDetails.scale < 0.5) {
                    scale = "<0.5";
                  }
                });
              },
              onInteractionEnd: (ScaleEndDetails endDetails) {
                controller.value = Matrix4.identity();
                setState(() {
                  velocity = endDetails.velocity.toString();
                });
              },
              child: Stack(children: _thingCards(widget.rhizome))),
        ),
        Text(scale, style: TextStyle(fontWeight: FontWeight.bold)),
      ]),
    );
  }

  List<TestContainer> _thingCards(Rhizome rhizome) {
    return rhizome
        .query()
        .map((thing) => TestContainer(thing: thing))
        .toList();
  }
}
