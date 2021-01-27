import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import '../widgets/thing_card.dart';

class CreateInformationScreen extends StatefulWidget {
  CreateInformationScreen({Key key}) : super(key: key);

  @override
  _CreateInformationScreen createState() => _CreateInformationScreen();
}

class _CreateInformationScreen extends State<CreateInformationScreen> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textField('Information'),
              ]
            ),
          ),
        ),
      ),
    );
  }

  TextFormField textField(String toolTipText) {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        labelText: toolTipText, border: OutlineInputBorder()),
      onSaved: (value) {
        // store value of object
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter data';
        } else {
          return null;
        }
      }
    );
  }
}