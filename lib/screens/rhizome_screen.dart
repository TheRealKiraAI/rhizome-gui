import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/screens/create_information_screen.dart';
import 'package:rhizome_gui/screens/moveable_screen.dart';
import '../models/rhizome_manager.dart';
import '../widgets/thing_card.dart';

class RhizomeScreen extends StatefulWidget {
  RhizomeScreen({Key key}) : super(key: key);

  final Rhizome rhizome = RhizomeManager.getInstance();

  @override
  _RhizomeScreenState createState() => _RhizomeScreenState();
}

class _RhizomeScreenState extends State<RhizomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rhizome'),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            children: _thingCards(widget.rhizome));
      }),
      floatingActionButton: _addButton(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[300],
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.compare_arrows),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MoveableScreen()));
                }),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
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
}
