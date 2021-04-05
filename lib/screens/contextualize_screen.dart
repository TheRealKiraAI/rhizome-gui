import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/models/rhizome_manager.dart';
import 'package:rhizome_gui/utils/size_config.dart';
import 'package:rhizome_gui/widgets/base_thing_card.dart';
import 'package:rhizome_gui/widgets/rect_thing_card.dart';

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

  // ignore: missing_return
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
    final sara = rhizome.seek('assets/images/sara.jpeg');
    
    final arches = rhizome.seek('assets/images/arches.jpeg');
    final zion = rhizome.seek('assets/images/beautahful.jpeg');

    return Scaffold(
      body: Center(
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // tags
              Expanded(child: sideRowCard(widget.tags)),
              // people, center, places
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  Expanded(child: Column(children: [ sideColumnCard(zion, "Zion"), sideColumnCard(arches, "Arches")])),
                  Expanded(child: centerCardImage(widget.thing)),
                  Expanded(child: Column(children: [ sideColumnCard(joe, "Joe"), sideColumnCard(sara, "Sara") ]))
                ]
              ),
              // targets
              Expanded(child: sideRowCard(widget.targets)),
          ]),
        ),
      ),
    );
  }

  Widget sideColumnCard(Thing thing, String label) {
    return Padding(
      padding: EdgeInsets.all(35),
      child: Column(children: [
        Container(
            margin: EdgeInsets.all(10),
            height: SizeConfig.blockSizeVertical * 10,
            width: SizeConfig.blockSizeHorizontal * 15,
            child: BaseThingCard(
                thing: thing,
                onDragged: () {
                  _renderDraggables();
                },
              ),
          ),
          Text(label, textScaleFactor: 1.0),
      ]),
    );
  }

  Widget sideRowCard(List<Thing> things) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: SizeConfig.blockSizeVertical * 15,
        width: SizeConfig.blockSizeHorizontal * 80,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children:  
            things
            .map((thing) => BaseThingCard(
                thing: thing,
                onDragged: () {
                  _renderDraggables();
                }))
            .toList()
        ),
      ),
    );
  }

  Widget centerCardImage(dynamic centerThing) {
    return Container(
      child: Hero(
        tag: centerThing.information,
        child: RectThingCard(
          thing: centerThing,
          onDragged: () {
            _renderDraggables();
          }
        )
      ),
    );
  }
}
