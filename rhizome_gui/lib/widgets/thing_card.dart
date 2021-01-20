import 'package:rhizome_gui/rhizome_gui.dart';

class ThingCard extends StatelessWidget {
  final Thing thing;

  ThingCard({this.thing});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.deepOrange),
      ),
      onPressed: () => print("pushed"),
      child: Card(
        color: Colors.lightBlueAccent,
        child: Center(
          child: Text(thing.information),
        ),
      ),
    );
  }
}