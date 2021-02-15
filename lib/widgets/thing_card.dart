import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/widgets/taggable_thing.dart';
import '../screens/thing_screen.dart';

class ThingCard extends StatelessWidget {
  final Uri uri;
  final Thing thing;
  final TaggableThing taggableThing;

  ThingCard(
      {this.uri,
      this.thing,
      List<Thing> tags,
      List<Thing> targets,
      this.taggableThing});

  @override
  Widget build(BuildContext context) {
    bool accepted = false;

    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.deepOrange),
      ),
      onPressed: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ThingScreen(thing: thing)))
      },
      child: LongPressDraggable(
        feedback: _thingContainer(accepted),
        child: _thingContainer(accepted),
        onDragEnd: (details) {
          // todo: Setup drag targets
          // taggableThing.addListener(() {
          //   print('value updated!');
          // });
          // taggableThing.tagThing();
          thing.tagWith(thing);
          print(thing.information);
          print(thing.tags);
          // todo: tag things
          print('dragged');
        },
      ),
    );
  }

  Widget _thingContainer(bool accepted) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
          height: 150,
          child: Card(
            color: Colors.lightBlueAccent,
            child: Center(
              child: Text(thing.information),
            ),
          ),
        ),
        DragTarget(
          builder: (context, thing, rejectedData) {
            return accepted ? Container(child: Text("accepted")) : Container();
          },
          onWillAccept: (data) {
            return true;
          },
          onAccept: (data) {
            accepted = true;
          },
        ),
      ],
    );
  }
}
