import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/models/rhizome_manager.dart';
import 'package:rhizome_gui/utils/size_config.dart';
import 'package:rhizome_gui/widgets/moveable_thing.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';
import 'package:rhizome_gui/widgets/thing_container.dart';

class ThingWorld extends StatefulWidget {
  final Thing thing;

  ThingWorld({Key key, this.thing}) : super(key: key);

  _ThingWorldState createState() => _ThingWorldState();
}

class _ThingWorldState extends State<ThingWorld> {
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
    final joe = rhizome.store('Joe');
    final zion = rhizome.store('Zion');

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: InteractiveViewer(
        panEnabled: true,
        boundaryMargin: EdgeInsets.all(double.infinity),
        minScale: 0.1,
        maxScale: 4,
        transformationController: controller,
        onInteractionUpdate: (ScaleUpdateDetails updateDetails) {
          setState(() {
            if (updateDetails.scale > 1.5) {
              _zoomedOut(false);
            }
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            // places
            Column(children: [ circleCard(zion, "Zion") ]),
            // focus Thing
            Column(children: [ centerCard(rhizome, widget.thing) ]),
            // people
            Column(children: [ circleCard(joe, "Joe")] ),
        ]),
      ),
    );
  }

  Widget circleCard(Thing thing, String label) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ThingCard(thing: thing),
          Text(label, textScaleFactor: 1.5),
        ]
      ),
    );
  }

  Widget centerCard(Rhizome rhizome, dynamic centerThing) {
    return Container(
      height: SizeConfig.blockSizeVertical * 70,
      width: SizeConfig.blockSizeHorizontal * 40,
      child: ThingContainer(thing: rhizome.seek('Moab')),
    );
  }
}
