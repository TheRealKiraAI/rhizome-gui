import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import '../models/rhizome_manager.dart';

class CreateInformationScreen extends StatefulWidget {
  final Rhizome rhizome = RhizomeManager.getInstance();
  static const routeName = '/create_info';

  CreateInformationScreen({Key key}) : super(key: key);

  @override
  _CreateInformationScreen createState() => _CreateInformationScreen();
}

class _CreateInformationScreen extends State<CreateInformationScreen> {
  final formKey = GlobalKey<FormState>();
  Thing informationThing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Information'),
      ),
      body: InteractiveViewer(
        panEnabled: true,
        onInteractionUpdate: (ScaleUpdateDetails details) {
          var myScale = details.scale;
          if (myScale <= 2.0) {
            Navigator.of(context).pop();
          }
          print(myScale);
        },
        boundaryMargin: EdgeInsets.all(80),
        minScale: 0.5,
        maxScale: 4,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: _informationForm(),
        ),
      ),
    );
  }

  Widget _informationForm() {
    return Form(
      key: formKey,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _textField('Information'),
          _saveButton(context),
        ],
      )),
    );
  }

  TextFormField _textField(String label) {
    return TextFormField(
        autofocus: true,
        decoration:
            InputDecoration(labelText: label, border: OutlineInputBorder()),
        validator: (value) => value.isEmpty ? 'Please enter data' : null,
        onSaved: (value) => informationThing = widget.rhizome.store(value));
  }

  Widget _saveButton(BuildContext context) {
    return RaisedButton(
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            Navigator.pop(context, informationThing.toString());
          }
        },
        child: Text('ADD TO RHIZOME'));
  }
}
