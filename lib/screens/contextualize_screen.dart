import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/models/rhizome_manager.dart';
import 'package:rhizome_gui/utils/size_config.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';

class ContextualizeScreen extends StatefulWidget {
  final Rhizome rhizome = RhizomeManager.getInstance();
  final Thing thing;
  List<Thing> tags;
  List<Thing> targets;

  ContextualizeScreen({Key key, this.thing}) : super(key: key) {
    tags = thing.tags.map((uri) => rhizome.retrieve(uri)).toList();
    targets = thing.targets.map((uri) => rhizome.retrieve(uri)).toList();
  }

  _ContextualizeScreenState createState() => _ContextualizeScreenState();
}

class _ContextualizeScreenState extends State<ContextualizeScreen> {
  TransformationController controller = TransformationController();

  void Function() _renderDraggables() {
    setState(() {
      widget.tags =
          widget.thing.tags.map((uri) => widget.rhizome.retrieve(uri)).toList();
      widget.targets = widget.thing.targets
          .map((uri) => widget.rhizome.retrieve(uri))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Rhizome rhizome = RhizomeManager.getInstance();
    final joe = rhizome.seek('assets/images/joe.jpeg');
    final zion = rhizome.seek('assets/images/beautahful.jpeg');
    final test = rhizome.seek('assets/images/beautahful.jpeg');

    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // tags
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  child: sideRowCard(widget.tags)
                ),
              ), 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                sideColumnCard(zion, test, "Zion"),
                centerCardImage(widget.thing),
                sideColumnCard(joe, test, "Joe"),
              ]),
              // targets
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  child: sideRowCard(widget.targets)
                ),
              ),
          ]),
        ),
      ),
    );
  }

  Widget sideColumnCard(Thing thing, Thing thing2, String label) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(85),
            width: 150,
            height: 150,
            child: ThingCard(
              thing: thing,
              onDragged: () {
                _renderDraggables();
              },
            ),
          ),
          Text(label, textScaleFactor: 1.5),
          Container(
            margin: EdgeInsets.all(10),
            width: 150,
            height: 150,
            child: ThingCard(
              thing: thing2,
              onDragged: () {
                _renderDraggables();
              },
            ),
          ),
          Text(label, textScaleFactor: 1.5),
        ],
    );
  }

  Widget sideRowCard(List<Thing> things) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:  
          things
          .map((thing) => ThingCard(
              thing: thing,
              onDragged: () {
                _renderDraggables();
              }))
          .toList()
      ),
    );
  }

  Widget centerCardImage(dynamic centerThing) {
    return Container(
      child: ThingCard(
        thing: centerThing,
        onDragged: () {
          _renderDraggables();
        }
      )
    );
  }
}
