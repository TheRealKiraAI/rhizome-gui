import 'package:flutter/material.dart';
import 'package:rhizome_gui/widgets/moveable_thing.dart';

class MoveableScreen extends StatefulWidget {
  @override
  _MoveableScreenState createState() => _MoveableScreenState();
}

class _MoveableScreenState extends State<MoveableScreen> {
  
  List<Widget> rhizomeContainer = [
    Container(
      width: 300,
      height: 600,
      color: Colors.purple,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Move Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Center(child: 
            Column(
              children: [
                Stack(children: rhizomeContainer),
                RaisedButton(
                  child: Text('Add Movable Thing'),
                  onPressed: () {
                    // setState(() {
                    //   rhizomeContainer.add(MoveableThing());
                    // });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
