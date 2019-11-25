import 'package:flutter/material.dart';
import 'package:relevant_systems/components/clippaths.dart';
import 'package:relevant_systems/components/normalInputField.dart';
import 'package:relevant_systems/components/passwordInputField.dart';
import 'package:relevant_systems/screens/login/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Relevant Systems',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily:'Gotham-Book',
            scaffoldBackgroundColor: Color(0XFF161d21),
            primaryColorDark: Color(0XFF161d21),
            primaryColor: Color(0xFF51fa8f),
            accentColor: Color(0xFF51fa8f)),
        home: BaseScreen());
  }
}

class BaseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
          TriangularPath(),
          SemiTriangularPath(),
          TopThinTriangularPath(),
          BottomThinTriangularPath(),
        LoginScreen()

      ],
    ),
        ));
  }
}




