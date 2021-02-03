import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';
import '../models/rhizome_manager.dart';

class ThingScreen extends StatelessWidget {
  ThingScreen({Key key, this.thing}) : super(key: key);

  final String title = "Thing Screen";
  final Thing thing;
  final Rhizome rhizome = RhizomeManager.getInstance();

  @override
  Widget build(BuildContext context) {
    final seekingThing = rhizome.seek(thing.information);
    final seekingTags = seekingThing.tags.map((uri) => rhizome.retrieve(uri));
    final seekingTargets =
        seekingThing.targets.map((uri) => rhizome.retrieve(uri));

    // FOR DEBUG
    debugPrint(thing, rhizome);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child: ListView.builder(
              itemCount: seekingTags.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Row (
                  children: <Widget> [ 
                    getTagWidgets(seekingTags),
                    getTagWidgets(seekingTags),
                    getTagWidgets(seekingTags),
                    getTagWidgets(seekingTags),
                    getTagWidgets(seekingTags),
                  ]
                );
                //return ListTile(
                //title: getTagWidgets(seekingTags),
                // subtitle: Text(widget.entries[index].dateTime),
                // trailing: Text(widget.entries[index].rating.toString()),
                // onTap: () {
                //   widget.entries[index].id = index;
                //   setDetails(widget.entries[index].id, widget.entries[index].title, widget.entries[index].body, widget.entries[index].rating, widget.entries[index].dateTime);
                //   // Navigator.push(context, MaterialPageRoute(
                //   //   builder: (context) => JournalDetails(journalItem: widget.entries[index])),
                //   // );
                // }
                //);
              }),
          // ListView(
          //   scrollDirection: Axis.horizontal,
          //   children: <Widget>[
          //     Container(
          //       width: 160.0,
          //       color: Colors.red,
          //     ),
          //     Container(
          //       width: 160.0,
          //       color: Colors.blue,
          //     ),
          //     Container(
          //       width: 160.0,
          //       color: Colors.green,
          //     ),
          //     Container(
          //       width: 160.0,
          //       color: Colors.yellow,
          //     ),
          //     Container(
          //       width: 160.0,
          //       color: Colors.orange,
          //     ),
          //   ],
          // ),
        ),
        Container(
          height: 300,
          width: 300,
          child: ThingCard(thing: thing),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 160.0,
                color: Colors.red,
              ),
              Container(
                width: 160.0,
                color: Colors.blue,
              ),
              Container(
                width: 160.0,
                color: Colors.green,
              ),
              Container(
                width: 160.0,
                color: Colors.yellow,
              ),
              Container(
                width: 160.0,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget getTagWidgets(Iterable<Thing> tags) {
    return new Column(
        children: tags.map((tag) => tagTargetTiles(tag)).toList());
  }

  Widget getTargetWidgets(Iterable<Thing> targets) {
    return new Column(
        children:
            targets.map((target) => new Text(target.information)).toList());
  }

  Widget tagTargetTiles(Thing tagTarget) {
    return Container(
      width: 160.0,
      color: Colors.purple[300],
      child: Text(tagTarget.information)
    );
  }

  void debugPrint(Thing thing, Rhizome rhizome) {
    print('Focusing on thing...');
    final seekingThing = rhizome.seek(thing.information);
    print(seekingThing.information);
    print('Tags:');
    final seekingTags = seekingThing.tags.map((uri) => rhizome.retrieve(uri));
    seekingTags.forEach((tag) => print(tag.information));
    print('Targets:');
    final motorsportTargets =
        seekingThing.targets.map((uri) => rhizome.retrieve(uri));
    motorsportTargets.forEach((tag) => print(tag.information));
  }
}
