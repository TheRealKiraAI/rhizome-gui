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

    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [sideColumnCard(zion, "Zion")])),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      sideRowCard(widget.tags),
                      //widget.image ? centerCardImage(rhizome, widget.thing) : centerCard(rhizome, widget.thing),
                      centerCardImage(rhizome, widget.thing),
                      sideRowCard(widget.targets),
                    ])),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [sideColumnCard(joe, "Joe")])),
          ]),
        ),
      ),
    );
  }

  Widget sideColumnCard(Thing thing, String label) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
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
        ],
      ),
    );
  }

  Widget sideRowCard(List<Thing> things) {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: things
              .map((thing) => ThingCard(
                  thing: thing,
                  onDragged: () {
                    _renderDraggables();
                  }))
              .toList()),
    );
  }

  Widget centerCard(Rhizome rhizome, dynamic centerThing) {
    final moabThing = rhizome.seek(widget.thing.information);

    return Container(
        height: SizeConfig.blockSizeVertical * 50,
        width: SizeConfig.blockSizeHorizontal * 30,
        child: ThingCard(thing: moabThing));
  }

  Widget centerCardImage(Rhizome rhizome, dynamic centerThing) {
    final moabThing = rhizome.seek(widget.thing.information);

    return Container(
        height: SizeConfig.blockSizeVertical * 50,
        width: SizeConfig.blockSizeHorizontal * 30,
        child: ThingCard(thing: centerThing));
  }
}
