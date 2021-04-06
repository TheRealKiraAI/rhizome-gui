import 'package:flutter/material.dart';
import 'package:rhizome_gui/widgets/base_thing_card.dart';

class MoveableThing extends StatefulWidget {
  final BaseThingCard thingCard;
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
}
