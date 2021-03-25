import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/models/rhizome_manager.dart';
import 'package:rhizome_gui/utils/size_config.dart';
import 'package:rhizome_gui/widgets/moveable_thing.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';
import 'package:rhizome_gui/widgets/thing_container.dart';

class CenterThingScreen extends StatefulWidget {
  final Thing thing;

  CenterThingScreen({Key key, this.thing}) : super(key: key);

  _CenterThingScreen createState() => _CenterThingScreen();
}

class _CenterThingScreen extends State<CenterThingScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
        child: InteractiveViewer(
          panEnabled: true,
          boundaryMargin: EdgeInsets.all(double.infinity),
          minScale: 0.1,
          maxScale: 4,
          // onInteractionUpdate: (ScaleUpdateDetails updateDetails) {
          //   setState(() {
          //     scale = updateDetails.scale.toString();
          //     if (updateDetails.scale < 0.8) {
          //       _zoomedOut(true);
          //     }
          //   });
          // },
          child: ThingCard(thing: widget.thing),
        ),
      )
    ]));
  }
}
