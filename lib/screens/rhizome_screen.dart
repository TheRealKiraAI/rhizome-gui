import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/screens/create_information_screen.dart';
import 'package:rhizome_gui/screens/thing_screen.dart';
import 'package:rhizome_gui/widgets/moveable_thing.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';
import '../models/rhizome_manager.dart';

class RhizomeScreen extends StatefulWidget {
  final Rhizome rhizome = RhizomeManager.getInstance();
  GlobalKey<NavigatorState> globalKey;

  RhizomeScreen({Key key, this.globalKey}) : super(key: key);

  @override
  _RhizomeScreenState createState() => _RhizomeScreenState();
}

class _RhizomeScreenState extends State<RhizomeScreen> {
  double viewPort = 0.5;
  PageController pageController;
  MoveableThing moveableThing;

  int currentPage = 1;
  bool isZoom = false;

  @override
  void initState() {
    pageController =
        PageController(initialPage: currentPage, viewportFraction: viewPort);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rhizome'),
        ),
        body: Container(
          child: InteractiveViewer(
            panEnabled: true,
            boundaryMargin: EdgeInsets.all(80),
            minScale: 0.5,
            maxScale: 4,
            onInteractionUpdate: (ScaleUpdateDetails details) {
              // get the scale from the ScaleUpdateDetails callback
              var myScale = details.scale;
              if (myScale >= 1.5) {
                //MoveableThing.onTapThingScreen(widget.globalKey);
                //print("Thing Screen");
                isZoom = true;
                Thing thing = widget.rhizome.store('test');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThingScreen(thing: thing)));
              }
              print(myScale); // print the scale here
            },
            child: Stack(children: _thingCards(widget.rhizome)),
          ),
        ),
        floatingActionButton: _addButton(),
        bottomNavigationBar: _bottomNavigationBar());
  }

  List<MoveableThing> _thingCards(Rhizome rhizome) {
    return rhizome
        .query()
        .map((thing) => MoveableThing(
            globalKey: widget.globalKey, thingCard: ThingCard(thing: thing)))
        .toList();
  }

  Widget _addButton() {
    return FloatingActionButton(
      onPressed: () => _displayCreateInformationScreen(context),
      child: Icon(Icons.add),
      backgroundColor: Colors.purple,
    );
  }

  _displayCreateInformationScreen(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateInformationScreen()),
    );

    setState(() {});
  }

  Widget _bottomNavigationBar() {
    return BottomAppBar(
      color: Colors.grey[300],
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
