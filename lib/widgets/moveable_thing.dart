import 'package:flutter/material.dart';

class MoveableThing extends StatefulWidget { 
  @override State<StatefulWidget> createState() { 
   return _MoveableThingState(); 
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
        child: Container(
          width: 150,
          height: 150,
          color: color,
        ),
      ),
    );
  }
}