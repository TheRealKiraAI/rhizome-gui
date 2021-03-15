import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/models/rhizome_manager.dart';
import 'package:rhizome_gui/widgets/moveable_thing.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';
import 'package:rhizome_gui/widgets/thing_container.dart';

class ThingWorld extends StatefulWidget {
  GlobalKey<NavigatorState> globalKey;
  final List<MoveableThing> moveableThing;
  final List<ThingContainer> list;
  List<Thing> tags;
  List<Thing> targets;

  ThingWorld({Key key, this.globalKey, this.moveableThing, this.list})
      : super(key: key);

  _ThingWorldState createState() => _ThingWorldState();
}

class _ThingWorldState extends State<ThingWorld> {
  String velocity = "velocity";
  String scale = "scale";
  TransformationController controller = TransformationController();

  bool visibilityTag = false;

  void _zoomedOut(bool visibility) {
    setState(() {
      visibilityTag = visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Rhizome rhizome = RhizomeManager.getInstance();
    final moabImage = Image.asset('assets/images/moab.jpg');
    final moabThing = rhizome.store('moab thing');
    final thing = rhizome.store('thing');

    moabThing.tagWith(thing);
    thing.tagWith(moabThing);

    return Column(children: [
      visibilityTag
          ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 11,
                  child: Container(
                    child: Center(
                      child: ThingContainer(
                          thing: moabThing, centerImage: moabImage),
                    ),
                  ),
                ),
              ],
              //),
              // Expanded(
              //     child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         crossAxisAlignment: CrossAxisAlignment.center,
              //         children: [
              //       Expanded(child: Container(child: Center(child: moabImage)))
              //     ])),
            )
          : Expanded(
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
                        _zoomedOut(true);
                      }
                    });
                  },
                  onInteractionEnd: (ScaleEndDetails endDetails) {
                    //controller.value = Matrix4.identity();
                  },
                  child: moabImage),
            ),
    ]);
    // Text(scale, style: TextStyle(fontWeight: FontWeight.bold)),
    // Container(
    //     child: Column(
    //   children: <Widget>[
    //     visibilityTag
    //         ? Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: <Widget>[
    //             Expanded(
    //               flex: 11,
    //               child: Center(
    //                 child: ThingContainer(thing: moabThing),
    //               ),
    //             ),
    //           ],
    //           )
    //         : new Container(),
    //   ],
    // )),
    //],
    //);
  }
}
