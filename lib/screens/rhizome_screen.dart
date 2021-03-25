import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/models/rhizome_manager.dart';
import 'package:rhizome_gui/screens/create_information_screen.dart';
import 'package:rhizome_gui/widgets/center_thing_screen.dart';
import 'package:rhizome_gui/widgets/thing_world.dart';

class RhizomeScreen extends StatefulWidget {
  GlobalKey<NavigatorState> globalKey;
  final Rhizome rhizome = RhizomeManager.getInstance();

  RhizomeScreen({Key key, this.globalKey}) : super(key: key);

  @override
  _RhizomeScreenState createState() => _RhizomeScreenState();
}

class _RhizomeScreenState extends State<RhizomeScreen> {
  bool visibilityTag = false;

  void _zoomedOut(bool visibility) {
    setState(() {
      visibilityTag = visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    final moabThing = widget.rhizome.store('Moab Thing');

    return Scaffold(
      appBar: AppBar(
        title: Text('Rhizome'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: visibilityTag ? ThingWorld(thing: moabThing) : CenterThingScreen(thing: moabThing),
      ),
    );
  }
}
