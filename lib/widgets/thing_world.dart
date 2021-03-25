import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/models/rhizome_manager.dart';
import 'package:rhizome_gui/utils/size_config.dart';
import 'package:rhizome_gui/widgets/moveable_thing.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';
import 'package:rhizome_gui/widgets/thing_container.dart';

class ThingWorld extends StatefulWidget {
  GlobalKey<NavigatorState> globalKey;
  final List<MoveableThing> moveableThing;
  final List<ThingContainer> list;
  List<Thing> tags;
  List<Thing> targets;

  ThingWorld({Key key, this.globalKey, this.moveableThing, this.list, Thing thing})
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
    SizeConfig().init(context);
    final Rhizome rhizome = RhizomeManager.getInstance();
    final moabImage = Image.asset('assets/images/moab.jpg');
    final moabThing = rhizome.store('Moab Thing');
    final joe = rhizome.store('Joe');
    final zion = rhizome.store('Zion');

    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      
          InteractiveViewer(
              panEnabled: true,
              boundaryMargin: EdgeInsets.all(double.infinity),
              minScale: 0.1,
              maxScale: 4,
              transformationController: controller,
              onInteractionUpdate: (ScaleUpdateDetails updateDetails) {
                setState(() {
                  scale = updateDetails.scale.toString();
                  if (updateDetails.scale > 1.5) {
                    _zoomedOut(false);
                  }
                });
              },
              child: Container(
                color: Colors.lightGreen,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      circleCard(
                          zion,
                          "Zion"),
                      centerCard(rhizome, moabThing),
                      circleCard(
                         joe,
                          "Joe"),
                    ]),
              ),
            ),
        ]),
        );
  }

  // Widget circleCard(String url, String label) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       Container(
  //         margin: EdgeInsets.all(10),
  //         width: 100,
  //         height: 100,
  //         decoration: BoxDecoration(
  //           shape: BoxShape.circle,
  //           image: DecorationImage(image: NetworkImage(url), fit: BoxFit.fill),
  //         ),
  //       ),
  //       Text(label, textScaleFactor: 1.5),
  //     ],
  //   );
  // }

  Widget circleCard(Thing thing, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ThingCard(thing: thing),
        Text(label, textScaleFactor: 1.5),
      ],
    );
  }

  Widget centerCard(Rhizome rhizome, dynamic centerThing) {
    return Container(
      height: SizeConfig.blockSizeVertical * 70,
      width: SizeConfig.blockSizeHorizontal * 70,
      child: Center(
        child: ThingContainer(thing: rhizome.seek('Moab')),
      ),
    );
  }
}
