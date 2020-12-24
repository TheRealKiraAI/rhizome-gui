import 'package:flutter/material.dart';
import 'package:rhizome_gui/home_page.dart';
import 'package:rhizome_gui/rhizome_gui.dart';

class App extends StatefulWidget {
  // final Rhizome rhizome;
  // const App(this.rhizome);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}