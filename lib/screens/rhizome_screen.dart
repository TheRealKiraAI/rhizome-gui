import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/screens/create_information_screen.dart';
import 'package:rhizome_gui/screens/moveable_screen.dart';
import '../models/rhizome_manager.dart';
import '../widgets/thing_card.dart';

class RhizomeScreen extends StatefulWidget {
  RhizomeScreen({Key key, this.title}) : super(key: key);

  final String title;
  final Rhizome rhizome = RhizomeManager.getInstance();

  @override
  _RhizomeScreenState createState() => _RhizomeScreenState();
}

class _RhizomeScreenState extends State<RhizomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          children: widget.rhizome
              .query()
              .map((thing) => ThingCard(thing: thing))
              .toList(),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _displayCreateInformationScreen(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
      bottomNavigationBar: BottomAppBar(
      color: Colors.blue,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(icon: Icon(Icons.compare_arrows), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MoveableScreen()));
          }),
          IconButton(icon: Icon(Icons.search), onPressed: () {},),
        ],
      ),
    ),
    );
  }

  _displayCreateInformationScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateInformationScreen()),
    );

    setState(() {
      widget.rhizome
          .query()
          .map((thing) => ThingCard(thing: thing))
          .toList();
    });

    // DEBUG
    print("$result");
  }
}
