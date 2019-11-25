import 'package:flutter/material.dart';
import 'package:relevant_systems/components/clippaths.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0XFF161d21),
        primaryColorDark: Color(0XFF161d21),
        primaryColor: Color(0xFF51fa8f),
        accentColor: Color(0xFF51fa8f)
      ),
      
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