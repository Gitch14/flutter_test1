import 'package:chobidesh/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "AdventPro",
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Test".toUpperCase(),
            style: TextStyle(letterSpacing: 1.5, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: HomeScreeen(),
      ),
    );
  }
}
