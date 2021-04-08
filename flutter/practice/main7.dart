import 'package:flutter/material.dart';
import 'package:flutter_application_5/ScreenA.dart';
import 'package:flutter_application_5/ScreenB.dart';
import 'package:flutter_application_5/ScreenC.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ScreenA(),
        '/b': (context) => ScreenB(),
        '/c': (context) => ScreenC(),
      },
    );
  }
}
