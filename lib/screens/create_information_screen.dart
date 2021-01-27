import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import '../widgets/thing_card.dart';

class CreateInformationScreen extends StatefulWidget {
  CreateInformationScreen({Key key}) : super(key: key);

  @override
  _CreateInformationScreen createState() => _CreateInformationScreen();
}

class _CreateInformationScreen extends State<CreateInformationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Information'),
      ),
      body: Center(
        child: Container(
            width: 100,
            height: 100,
            color: Colors.purple,
        ),
      ),
    );
  }
}