import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';
import '../models/rhizome_manager.dart';

class ThingCardScreen extends StatelessWidget {
  ThingCardScreen({Key key, this.thing}) : super(key: key);

  final String title = "Thing Screen";
  final Thing thing;
  final Rhizome rhizome = RhizomeManager.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container (
          height: 300,
          width: 300,
          child: ThingCard(thing: thing),
        ),
      )
    );
  }
}