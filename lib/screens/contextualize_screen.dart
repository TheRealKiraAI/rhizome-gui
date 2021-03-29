import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/models/rhizome_manager.dart';
import 'package:rhizome_gui/utils/size_config.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';
import 'package:rhizome_gui/widgets/thing_container.dart';

class ContextualizeScreen extends StatefulWidget {
  final Thing thing;

  ContextualizeScreen({Key key, this.thing}) : super(key: key);

  _ContextualizeScreenState createState() => _ContextualizeScreenState();
}

class _ContextualizeScreenState extends State<ContextualizeScreen> {
  TransformationController controller = TransformationController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Rhizome rhizome = RhizomeManager.getInstance();
    final joe = rhizome.store('Joe');
    final zion = rhizome.store('Zion');

    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            // places
            Column(children: [circleCard(zion, "Zion")]),
            // focus Thing
            Column(children: [centerCard(rhizome, widget.thing)]),
            // people
            Column(children: [circleCard(joe, "Joe")]),
          ]),
        ),
      ),
    );
  }

  Widget circleCard(Thing thing, String label) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ThingCard(thing: thing),
            Text(label, textScaleFactor: 1.5),
          ]),
    );
  }

  Widget centerCard(Rhizome rhizome, dynamic centerThing) {
    return Container(
      height: SizeConfig.blockSizeVertical * 70,
      width: SizeConfig.blockSizeHorizontal * 40,
      child: ThingContainer(thing: rhizome.seek('Moab')),
    );
  }
}
