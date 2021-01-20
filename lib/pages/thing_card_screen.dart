import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';

class ThingCardScreen extends StatefulWidget {
  ThingCardScreen({Key key, this.thing}) : super(key: key);

  final String title = "Thing Screen";
  final Thing thing;

  @override
  _ThingCardScreenState createState() => _ThingCardScreenState();
}

class _ThingCardScreenState extends State<ThingCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: Colors.lightGreenAccent,
            child: Center(
              child: Text(widget.thing.information),
            ),
          ),
        ],
      ),
    );
  }
}
