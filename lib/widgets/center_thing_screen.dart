import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/models/rhizome_manager.dart';
import 'package:rhizome_gui/utils/size_config.dart';
import 'package:rhizome_gui/widgets/moveable_thing.dart';
import 'package:rhizome_gui/widgets/thing_container.dart';

class CenterThingScreen extends StatefulWidget {
  GlobalKey<NavigatorState> globalKey;
  final List<MoveableThing> moveableThing;
  final List<ThingContainer> list;
  List<Thing> tags;
  List<Thing> targets;

  CenterThingScreen({Key key, this.globalKey, this.moveableThing, this.list})
      : super(key: key);

  _CenterThingScreen createState() => _CenterThingScreen();
}

class _CenterThingScreen extends State<CenterThingScreen> {
  String velocity = "velocity";
  String scale = "scale";
  TransformationController controller = TransformationController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Rhizome rhizome = RhizomeManager.getInstance();
    final moabImage = Image.asset('assets/images/moab.jpg');
    final moab = rhizome.store(moabImage);

    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(child: moabImage),
    ]));
  }
}
