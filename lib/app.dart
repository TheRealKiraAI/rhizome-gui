import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'home_page.dart';

class App extends StatelessWidget {
  final Rhizome rhizome;
  const App(this.rhizome);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Rhizome GUI', rhizome: rhizome),
    );
  }
}
