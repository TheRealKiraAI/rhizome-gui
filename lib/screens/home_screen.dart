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

  List<ThingCard> rhizomeMap;
  ThingCard thingCard;
  bool isClicked = false;

  @override
  void initState() {
    super.initState();

    if(isClicked) {
      loadRhizomeMap();
      isClicked = false;
    }
  }
  
  void loadRhizomeMap() {
    setState( () {
      widget.rhizome.query().map( (thing) => ThingCard(thing: thing, rhizome: widget.rhizome)).toList();
    });
  }

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
          // setState(() {
          //   widget.rhizome.store('New Values');
          //   isClicked = true;
          // });
          displayCreateInformationScreen(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
    );
  }

  displayCreateInformationScreen(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateInformationScreen(rhizome: widget.rhizome)),
    );

    setState(() {
      widget.rhizome.query().map( (thing) => ThingCard(thing: thing, rhizome: widget.rhizome)).toList();
    });
    print("$result");
  }
}