import 'package:flutter/material.dart';
import 'package:rhizome/rhizome.dart';
import 'screens/home_screen.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rhizome Shell',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(title: 'Rhizome GUI'),
    );
  }
  
}
