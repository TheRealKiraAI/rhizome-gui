import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/models/rhizome_manager.dart';
import 'package:rhizome_gui/screens/contextualize_screen.dart';

class RhizomeScreen extends StatefulWidget {
  final Rhizome rhizome = RhizomeManager.getInstance();

  RhizomeScreen({Key key}) : super(key: key);

  @override
  _RhizomeScreenState createState() => _RhizomeScreenState();
}

class _RhizomeScreenState extends State<RhizomeScreen> {
  TransformationController controller = TransformationController();

  @override
  Widget build(BuildContext context) {
    final moabImage = widget.rhizome.seek('assets/images/moab.jpg');
    var initController;

    return Scaffold(
      appBar: AppBar(
        title: Text('Rhizome'),
      ),
      body: Center(
        child: InteractiveViewer(
          panEnabled: true,
          boundaryMargin: EdgeInsets.all(double.infinity),
          minScale: 0.1,
          maxScale: 4,
          transformationController: controller,
          onInteractionStart: (details) {
            initController = controller.value;
          },
          onInteractionUpdate: (ScaleUpdateDetails details) {
            print('Pinch detected: ' + details.scale.toString());
            if (details.scale <= 0.6) {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ContextualizeScreen(thing: moabImage)));
              });
            }
          },
          onInteractionEnd: (ScaleEndDetails details) {
            controller.value = initController;
          },
          child: Hero(
            tag: moabImage.information,
            child: Image(
              image: AssetImage('assets/images/moab.jpg'),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fill,
            ),
          ),
        ),
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
