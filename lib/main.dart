import 'package:flutter/material.dart';
import 'package:relevant_systems/components/clippaths.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      home: MyHomeSection()
    );
  }
}

class MyHomeSection extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Stack(
        children: <Widget>[
          TriangularPath(),
          SemiTriangularPath(),
          TopThinTriangularPath(),
          BottomThinTriangularPath(), 
        ],
      )
    );
  }
}