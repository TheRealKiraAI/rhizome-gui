import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/screens/create_information_screen.dart';
import '../widgets/thing_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title, this.rhizome}) : super(key: key);

  final String title;
  final Rhizome rhizome;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          children: widget.rhizome.query().map( (thing) => ThingCard(thing: thing, rhizome: widget.rhizome)).toList(),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _displayCreateInformationScreen(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
    );
  }

  _displayCreateInformationScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateInformationScreen()),
    );

    setState(() {
      widget.rhizome.query().map( (thing) => ThingCard(thing: thing, rhizome: widget.rhizome)).toList();
    });

    // DEBUG
    print("$result");
  }
}