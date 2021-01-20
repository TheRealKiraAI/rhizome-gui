import 'package:rhizome_gui/rhizome_gui.dart';

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
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget> [
          SizedBox(
            height: 400, // constrain height
            child: GridView.count(
              crossAxisCount: 2,
              children: [ 
                for(var thing in widget.rhizome.query()) thingCard(thing)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget visualizeOneThing(Rhizome rhizome) {
    final everything = rhizome.query();
    Text textWidget;

    everything.forEach((thing) {
      print('========== Experiencing Test ==========');
      print('${thing}');
      textWidget = Text('${thing.information}');
    });

    return textWidget;
  }

  Widget thingCard(Thing thing) {
    return Card(
      color: Colors.lightBlueAccent,
      child: Center(
        child: Text(thing.information),
      ),
    );
  }
}
