import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import '../widgets/thing_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title, this.rhizome}) : super(key: key);

  final String title;
  final Rhizome rhizome;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Offset offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: OrientationBuilder(builder: (context, orientation) {
      //   return GridView.count(
      //     crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
      //     children: widget.rhizome.query().map( (thing) => ThingCard(thing: thing, rhizome: widget.rhizome)).toList()
      //   );
      // }),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: offset.dx,
            top: offset.dy,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  offset = Offset(offset.dx + details.delta.dx, offset.dy + details.delta.dy);
                });
              },
              child: Container(
                width: 100, 
                height: 100, 
                color: Colors.blue,
                // how to create draggable box for each map item
                // children: widget.rhizome.query().map( (thing) => ThingCard(thing: thing, rhizome: widget.rhizome)).toList()
                child: Text('Thing', textAlign: TextAlign.center),
              ),
            ),
          ),
        ],
      )
    );
  }
}
