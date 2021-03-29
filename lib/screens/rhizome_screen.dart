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
  Image thingImage;
  bool isImage = false;

  bool _defineImage(Thing thing) {
    if (thing.information.contains('asset')) {
      setState(() {
        isImage = true;
      });
    } else {
      setState(() {
        isImage = false;
      });
    }
    return isImage;
  }

  @override
  Widget build(BuildContext context) {
    final moabText = widget.rhizome.seek('Moab');
    final moabImage = widget.rhizome.seek('assets/images/moab.jpg');
    bool isImage = _defineImage(moabImage);

    return Scaffold(
      appBar: AppBar(
        title: Text('Rhizome'),
      ),
      body: Center(
        child: isImage
            ? Image.asset(moabImage.information)
            : ThingCard(thing: moabImage),
      ),
      floatingActionButton: _addButton(moabImage, isImage),
    );
  }

  Widget _addButton(Thing thing, bool isImage) {
    return FloatingActionButton(
      onPressed: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ContextualizeScreen(thing: thing, image: isImage)))
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.purple,
    );
  }
}
