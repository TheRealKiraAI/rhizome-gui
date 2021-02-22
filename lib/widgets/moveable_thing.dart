import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:rhizome_gui/screens/thing_screen.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';
import 'package:rhizome_gui/app.dart';

class MoveableThing extends StatefulWidget {
  final ThingCard thingCard;
  GlobalKey<NavigatorState> globalKey;

  MoveableThing({Key key, this.thingCard, this.globalKey}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MoveableThingState();
  }

  static void onTapThingScreen(GlobalKey<NavigatorState> globalKey) {
    print("onTap");
    globalKey.currentState.pushNamed('/create_info');
  }
}

class _MoveableThingState extends State<MoveableThing> {
  double xPosition = 0;
  double yPosition = 0;
  Color color;

  @override
  void initState() {
    color = Colors.blue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: yPosition,
      left: xPosition,
      child: InteractiveViewer(
        panEnabled: true,
        boundaryMargin: EdgeInsets.all(80),
        minScale: 0.5,
        maxScale: 4,
        onInteractionUpdate: (ScaleUpdateDetails details) {
          // get the scale from the ScaleUpdateDetails callback
          var myScale = details.scale;
          if (myScale >= 1.5) {
            //MoveableThing.onTapThingScreen(widget.globalKey);
            //print("Thing Screen");
            print("zoom");
          }
          print(myScale); // print the scale here
        },
        child: GestureDetector(
          onPanUpdate: (tapInfo) {
            setState(() {
              xPosition += tapInfo.delta.dx;
              yPosition += tapInfo.delta.dy;
            });
          },
          child: Hero(
            tag: widget.thingCard.thing.information,
            child: widget.thingCard,
          ),
        ),
      ),
    );
  }

  Widget updateInteraction(bool isZoom) {
    return InteractiveViewer(
        panEnabled: true,
        boundaryMargin: EdgeInsets.all(80),
        minScale: 0.5,
        maxScale: 4,
        onInteractionUpdate: (ScaleUpdateDetails details) {
          // get the scale from the ScaleUpdateDetails callback
          var myScale = details.scale;
          if (isZoom) {
            //MoveableThing.onTapThingScreen(widget.globalKey);
            //print("Thing Screen");
            print("zoom");
          }
          print(myScale); // print the scale here
        },
        child: GestureDetector(
          onPanUpdate: (tapInfo) {
            setState(() {
              xPosition += tapInfo.delta.dx;
              yPosition += tapInfo.delta.dy;
            });
          },
          child: Hero(
            tag: widget.thingCard.thing.information,
            child: widget.thingCard,
          ),
        ),
      );
  }

  void _onTapThingScreen() {
    print('_ontap');
    //widget.globalKey.currentState.pushNamed('thing_screen');
  }
}
