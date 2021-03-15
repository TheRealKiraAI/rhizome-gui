import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/models/rhizome_manager.dart';
import 'package:rhizome_gui/utils/size_config.dart';
import 'package:rhizome_gui/widgets/moveable_thing.dart';
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
    SizeConfig().init(context);
    final Rhizome rhizome = RhizomeManager.getInstance();
    final moabImage = Image.asset('assets/images/moab.jpg');

    return Column(
      children: [
      visibilityTag
        ? InteractiveViewer(
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
                child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                                    height: SizeConfig.blockSizeVertical * 70,
                  width: SizeConfig.blockSizeHorizontal * 70,
                  child: Center(
                    child: ThingContainer(
                        thing: rhizome.seek('Moab'), centerImage: moabImage),
                  ),
                ),
            ]),
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
                    if (updateDetails.scale < 0.8) {
                      _zoomedOut(true);
                    }
                  });
                },
                child: moabImage),
          ),
    ]);
  }
}
