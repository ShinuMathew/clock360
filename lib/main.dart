import 'package:clock360/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:clock360/screens/loading.dart';
import 'package:clock360/screens/choose_location.dart';

void main() => runApp(Clock360());

class Clock360 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
    //  Routing
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    );
  }
}