import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/models/rhizome_manager.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';

class RhizomeScreen extends StatefulWidget {
  GlobalKey<NavigatorState> globalKey;
  final Rhizome rhizome = RhizomeManager.getInstance();

  RhizomeScreen({Key key, this.globalKey}) : super(key: key);

  @override
  _RhizomeScreenState createState() => _RhizomeScreenState();
}

class _RhizomeScreenState extends State<RhizomeScreen> {
  @override
  Widget build(BuildContext context) {
    final moabThing = widget.rhizome.store('Moab Thing');

    return Scaffold(
      appBar: AppBar(
        title: Text('Rhizome'),
      ),
      body: Center(
        child: ThingCard(thing: moabThing),
      ),
    );
  }
}
