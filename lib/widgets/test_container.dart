import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/models/rhizome_manager.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';

class TestContainer extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175.0,
      color: Colors.purple
      // child: ListView(
      //   scrollDirection: Axis.horizontal,
      //   children: tags.map((thing) => ThingCard(thing: thing)).toList()),
    );
  }
}