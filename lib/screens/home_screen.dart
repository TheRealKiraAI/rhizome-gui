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
  @override
  Widget build(BuildContext context) {
    // function: Card ThingCard(Thing thing)
    // iterate through map to add everything to ThingCard
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          children: widget.rhizome.query().map( (thing) => ThingCard(thing: thing)).toList()
        );
      }),
    );
  }

  Widget visualizeOneThing(Rhizome rhizome) {
    final everything = rhizome.query();
    Text textWidget;

    everything.forEach((thing) {
      print('========== Experiencing Test ==========');
      print('$thing');
      textWidget = Text('${thing.information}');
    });

    return textWidget;
  }
}
