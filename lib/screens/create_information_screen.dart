import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import '../widgets/movable_thing.dart';

class CreateInformationScreen extends StatefulWidget {
  CreateInformationScreen({Key key, this.rhizome}) : super(key: key);

  final Rhizome rhizome;

  @override
  _CreateInformationScreen createState() => _CreateInformationScreen();
}

class _CreateInformationScreen extends State<CreateInformationScreen> {
  final formKey = GlobalKey<FormState>();
  Thing informationThing;
  Thing tagThing;

  List<Widget> rhizomeContainer = [
    Container(
      width: 150,
      height: 150,
      color: Colors.purple,
    )
  ];

  List<Thing> rhizomeThings;

  Offset offset = Offset.zero;
  Color caughtColor = Colors.grey;
  bool isDragged = false;

  @override
  Widget build(BuildContext context) {
    //rhizomeList = widget.rhizome.query();

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: [
                    textField('Information'),
                    saveButton(context),
                    Container(height: 20),
                    Stack(children: rhizomeContainer),
                    RaisedButton(
                      child: Text('Add Movable Thing'),
                      onPressed: () {
                        setState(() {
                          rhizomeContainer.add(MovableThing());
                        });
                      },
                    )
                  ]),
                ],
              )
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
          informationThing = widget.rhizome.store(value);
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter data';
          } else {
            return null;
          }
        });
  }

  void listRhizome() {
    rhizomeThings = widget.rhizome
      .query()
      .map((thing) => MovableThing()).cast<Thing>()
      .toList();
  }

  Widget saveButton(BuildContext context) {
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
