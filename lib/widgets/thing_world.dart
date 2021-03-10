import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'package:rhizome_gui/models/rhizome_manager.dart';
import 'package:rhizome_gui/widgets/moveable_thing.dart';
import 'package:rhizome_gui/widgets/thing_container.dart';

class ThingWorld extends StatefulWidget {
  final Rhizome rhizome = RhizomeManager.getInstance();
  GlobalKey<NavigatorState> globalKey;
  final List<MoveableThing> moveableThing;
  final List<ThingContainer> list;
  List<Thing> tags;
  List<Thing> targets;

  ThingWorld({Key key, this.globalKey, this.moveableThing, this.list})
      : super(key: key);

  _ThingWorldState createState() => _ThingWorldState();
}

class _ThingWorldState extends State<ThingWorld> {
  String velocity = "velocity";
  String scale = "scale";
  TransformationController controller = TransformationController();

  bool visibilityTag = false;
  bool visibilityObs = false;

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "tag"){
        visibilityTag = visibility;
      }
      if (field == "obs"){
        visibilityObs = visibility;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Expanded(
          child: InteractiveViewer(
              panEnabled: true,
              boundaryMargin: EdgeInsets.all(double.infinity),
              minScale: 0.1,
              maxScale: 4,
              transformationController: controller,
              onInteractionUpdate: (ScaleUpdateDetails updateDetails) {
                setState(() {
                  scale = updateDetails.scale.toString();
                  if (updateDetails.scale < 0.5) {
                    scale = "<0.5";
                    _changed(true, "tag");
                  }
                });
              },
              onInteractionEnd: (ScaleEndDetails endDetails) {
                controller.value = Matrix4.identity();
                setState(() {
                  velocity = endDetails.velocity.toString();
                });
              },
              child: Image.asset('assets/images/moab.jpg')),
        ),
        Text(scale, style: TextStyle(fontWeight: FontWeight.bold)),
        Container(
          child: Column(
            children: <Widget>[
                visibilityTag ? new Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new Expanded(
                      flex: 11,
                      child: new TextField(
                        maxLines: 1,
                        style: Theme.of(context).textTheme.title,
                        decoration: new InputDecoration(
                          labelText: "Tags",
                          isDense: true
                        ),
                      ),
                    ),
                    new Expanded(
                      flex: 1,
                      child: new IconButton(
                        color: Colors.grey[400],
                        icon: const Icon(Icons.cancel, size: 22.0,),
                        onPressed: () {
                          _changed(false, "tag");
                        },
                      ),
                    ),
                  ],
                ) : new Container(),
              ],
            )
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new SizedBox(width: 24.0),
              new InkWell(
                onTap: () {
                  visibilityTag ? null : _changed(true, "tag");
                },
                child: new Container(
                  margin: new EdgeInsets.only(top: 16.0),
                  child: new Column(
                    children: <Widget>[
                      new Icon(Icons.local_offer, color: visibilityTag ? Colors.grey[400] : Colors.grey[600]),
                      new Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: new Text(
                          "Tags",
                          style: new TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: visibilityTag ? Colors.grey[400] : Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ],
          )                    
        ],
      )
    );
  }
}
