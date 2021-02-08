import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/screens/create_information_screen.dart';
import 'package:rhizome_gui/screens/moveable_screen.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;
import '../models/rhizome_manager.dart';
import '../widgets/thing_card.dart';

class RhizomeScreen extends StatefulWidget {
  final Rhizome rhizome = RhizomeManager.getInstance();

  RhizomeScreen({Key key}) : super(key: key);

  @override
  _RhizomeScreenState createState() => _RhizomeScreenState();
}

class _RhizomeScreenState extends State<RhizomeScreen> {
  double _scale = 1.0;
  double _previousScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rhizome'),
        ),
        body: GestureDetector(
          onScaleStart: (ScaleStartDetails details) {
            _previousScale = _scale;
            setState(() {});
          },
          onScaleUpdate: (ScaleUpdateDetails details) {
            _scale = _previousScale * details.scale;
            setState(() {});
          },
          onScaleEnd: (ScaleEndDetails details) {
            _previousScale = 1.0;
            setState(() {});
          },
          child: RotatedBox(
            quarterTurns: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.diagonal3(Vector3(_scale, _scale, _scale)),
                child: OrientationBuilder(builder: (context, orientation) {
                  return GridView.count(
                      crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                      children: _thingCards(widget.rhizome));
                }),
              ),
            ),
          ),
        ),
        floatingActionButton: _addButton(),
        bottomNavigationBar: _bottomNavigationBar());
  }

  List<ThingCard> _thingCards(Rhizome rhizome) {
    return rhizome.query().map((thing) => ThingCard(thing: thing)).toList();
  }

  Widget _addButton() {
    return FloatingActionButton(
      onPressed: () => _displayCreateInformationScreen(context),
      child: Icon(Icons.add),
      backgroundColor: Colors.purple,
    );
  }

  _displayCreateInformationScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateInformationScreen()),
    );

    // DEBUG
    print("$result");
  }

  Widget _bottomNavigationBar() {
    return BottomAppBar(
      color: Colors.grey[300],
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.compare_arrows),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MoveableScreen()));
              }),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
