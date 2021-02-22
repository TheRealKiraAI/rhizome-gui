import 'package:flutter/material.dart';
import 'package:rhizome_gui/screens/create_information_screen.dart';
import 'package:rhizome_gui/screens/thing_screen.dart';
import 'package:rhizome_gui/widgets/thing_card.dart';
import 'screens/rhizome_screen.dart';

class App extends StatelessWidget {

  static final routes = {
    ThingScreen.routeName: (context) => ThingScreen(),
    CreateInformationScreen.routeName: (context) => CreateInformationScreen(),
  };

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rhizome Shell',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RhizomeScreen(globalKey: navigatorKey),
      navigatorKey: navigatorKey,
      routes: routes,
    );
  }

}
