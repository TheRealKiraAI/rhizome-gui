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
    final moabThing = widget.rhizome.seek('assets/images/moab.jpg');
    Image thingImage;
    bool isImage = false;

    if (moabThing.information.contains('asset')) {
      thingImage = Image.asset(moabThing.toString());
      isImage = true;
    } else {
      isImage = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Rhizome'),
      ),
      body: Center(
        child: isImage ? Image.asset(moabThing.information) : ThingCard(thing: moabThing),
      ),
      floatingActionButton: _addButton(moabThing),
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
