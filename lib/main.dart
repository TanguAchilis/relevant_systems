import 'package:flutter/material.dart';
import 'package:relevant_systems/components/clippaths.dart';
import 'package:relevant_systems/components/normalInputField.dart';
import 'package:relevant_systems/components/passwordInputField.dart';

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
            accentColor: Color(0xFF51fa8f)),
        home: MyHomeSection());
  }
}

class MyHomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
          TriangularPath(),
          SemiTriangularPath(),
          TopThinTriangularPath(),
          BottomThinTriangularPath(),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: screensize.height / 10),
      
            padding: EdgeInsets.symmetric(
                
                horizontal: screensize.width / 30),
            width: screensize.width / 1.13,
            constraints: BoxConstraints(
              minHeight: screensize.height / 1.6,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: screensize.height / 30,),
                Text('Welcome back!', style: TextStyle(fontSize: 20, fontFamily:'Gotham-Book', color: Colors.grey)),
                SizedBox(height: screensize.height/100,),
                Text('Relevant Systems',  style: TextStyle(fontSize: 30, color: Colors.grey.shade800, fontFamily: 'Gotham-Medium', fontWeight: FontWeight.w900),),
                SizedBox(height: screensize.height/18,),

                NormalInputField(labelText: 'Email Address',),

                PasswordInputField(labelText: 'Password',),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      child: Text('Forget password'),
                    )
                  ],
                ),

                SizedBox(height: screensize.height/30),

                MaterialButton(
                  minWidth: screensize.width / 1.13 - screensize.width / 15,
                  padding: EdgeInsets.symmetric(vertical:screensize.width / 20 ),
                  child: Text('LOGIN', style: TextStyle(fontSize: 20,color: Colors.white, fontFamily: 'Gotham-Medium'),),
                  color: Theme.of(context).primaryColor,
                  onPressed: (){

                  },
                ),

                SizedBox(height: screensize.height/40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Don\'t have an account?', style:TextStyle(color: Colors.grey.shade400)),
                    FlatButton(
                      child: Text('Create', style: TextStyle(fontSize: 16, color: Colors.black)),
                    )
                  ],
                ),

                

              ],
            ),
          ),
      ],
    ),
        ));
  }
}




