import 'package:flutter/material.dart';
import 'package:flare_tutorial/flare_demo.dart';
import 'package:flare_tutorial/smart_flare_animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: SmartFlareAnimation()
      )
    );
  }
}