import 'package:rhizome_gui/rhizome_gui.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title, this.rhizome}) : super(key: key);

  final String title;
  final Rhizome rhizome;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // function: Card ThingCard(Thing thing)
    // iterate through map to add everything to ThingCard
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          children: <Widget>[
            for (var thing in widget.rhizome.query()) ThingCard(thing: thing)
          ],
          //children: widget.rhizome.query().map { ThingCard(thing) }.toList()
        );
      }),
    );
  }

  Widget visualizeOneThing(Rhizome rhizome) {
    final everything = rhizome.query();
    Text textWidget;

    everything.forEach((thing) {
      print('========== Experiencing Test ==========');
      print('$thing');
      textWidget = Text('${thing.information}');
    });

    return textWidget;
  }
}
