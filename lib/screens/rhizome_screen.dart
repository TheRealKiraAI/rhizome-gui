import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/models/rhizome_manager.dart';
import 'package:rhizome_gui/screens/contextualize_screen.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';

class RhizomeScreen extends StatefulWidget {
  final Rhizome rhizome = RhizomeManager.getInstance();

  RhizomeScreen({Key key}) : super(key: key);

  @override
  _RhizomeScreenState createState() => _RhizomeScreenState();
}

class _RhizomeScreenState extends State<RhizomeScreen> {
  @override
  Widget build(BuildContext context) {
    final moabText = widget.rhizome.seek('Moab');
    final moabImage = widget.rhizome.seek('assets/images/moab.jpg');

    return Scaffold(
      appBar: AppBar(
        title: Text('Rhizome'),
      ),
      body: Center(
        child: ThingCard(thing: moabImage),
      ),
      floatingActionButton: _addButton(moabImage),
    );
  }

  Widget _addButton(Thing thing) {
    return FloatingActionButton(
      onPressed: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ContextualizeScreen(thing: thing)))
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.purple,
    );
  }
}
