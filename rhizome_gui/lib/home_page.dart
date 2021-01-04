import 'package:rhizome_gui/rhizome_gui.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Thing> _initRhizome() {
    final rhizome = Rhizome();
  
    tagInformation(rhizome);

    // Now that we have some Things in the Rhizome, let's play with it. 
    // Display all of the information in the world.
    final everything = displayEverythingPrint(rhizome);

    // Imagine that the user indicates they wish to focus on one piece of
    // information. Say, Lewis Hamilton.
    print('Experiencing. Focusing on Thing: ');
    final lewisHamilton = everything[2];
    print(lewisHamilton.information);
    print('Tags:');
    final tags = lewisHamilton.tags.map((uri) => rhizome.retrieve(uri));
    tags.forEach((tag) => print(tag.information));
    print('Targets:');
    final targets = lewisHamilton.targets.map((uri) => rhizome.retrieve(uri));
    targets.forEach((tag) => print(tag.information));
    
    print('\n');
    
    // Let's say they want to see if they can view the concept of 'Motorsport'.
    // We can imagine they hit a key, see a text field, and type in 'Motorsport'.
    // It's in the Rhizome, so let's draw our focus on it.
    print('Experiencing. Focusing on Thing: ');
    final motorsportThing = rhizome.seek('Motorsport');
    print(motorsportThing.information);
    print('Tags:');
    final motorsportTags = motorsportThing.tags.map((uri) => rhizome.retrieve(uri));
    motorsportTags.forEach((tag) => print(tag.information));
    print('Targets:');
    final motorsportTargets = motorsportThing.targets.map((uri) => rhizome.retrieve(uri));
    motorsportTargets.forEach((tag) => print(tag.information));

    print(everything[2]);
    return everything;
  }

  @override
  Widget build(BuildContext context) {
    List<Thing> everything = _initRhizome();
    final lewisHamilton = everything[2];

    print('========== Experiencing Test ==========');
    experienceThing(lewisHamilton, everything);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(everything.length, (index) {
          return Container(
            child: Card(
              color: Colors.lightBlueAccent,
              child: Center(
                child: Text('Experiencing. Focusing on Thing.'),
              ),
            ),
            // child: Text(
            //   'Item $index',
            //   style: Theme.of(context).textTheme.headline5,
            // ),
          );
        }),
      ),
    );
  }

  void experienceThing(Thing thing, List<Thing> everything) {
    final rhizome = Rhizome();
    tagInformation(rhizome);

    print(thing.information);
    print('Tags:');
    final tags = thing.tags.map((uri) => rhizome.retrieve(uri));
    tags.forEach((tag) => print(tag.information));
    print('Targets:');
    final targets = thing.targets.map((uri) => rhizome.retrieve(uri));
    targets.forEach((tag) => print(tag.information));
  }

  void tagInformation(Rhizome rhizome) {
    // Typically, the rhizome will already have information, but in this example
    // it doesn't. Let's seed the rhizome with some information.
    final f1 = rhizome.store('Formula 1');
    final motorsport = rhizome.store('Motorsport');
    final hamilton = rhizome.store('Lewis Hamilton');
    final senna = rhizome.store('Ayrton Senna');

    // Information in the rhizome will likely be contextualized ("tagged") with
    // other information. Let's contextualize our information seeds.
    f1.tagWith(motorsport);
    motorsport.tagWith(f1);
    hamilton.tagWith(senna);
    hamilton.tagWith(f1);
    senna.tagWith(hamilton);
    senna.tagWith(f1);
  }

  displayEverythingPrint(Rhizome rhizome) {
    final everything = rhizome.query();
    print('Exploring. Rhizome contains: \n');
    everything.forEach((thing) {
      print('${thing}\n');
    });

    print('\n');
    return everything;
  }

    displayEverythingText(Rhizome rhizome) {
    final everything = rhizome.query();

    everything.forEach((thing) {
      Text('${thing}');
    });

    return everything;
  }

  Widget displayThings(Thing thing) {
    return Container(
      width: 240.0,
      height: 42.0,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Colors.black,
          width: 5.0
        )
      ),
      child: Center(
        child: Text(
          thing.toString(),
          textAlign: TextAlign.center,
        ),
      )
    );
  }

}
