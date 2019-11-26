import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relevant_systems/components/normalInputField.dart';
import 'package:relevant_systems/components/passwordInputField.dart';
import 'package:relevant_systems/providers/loginSignUpProvider.dart';
import 'package:relevant_systems/screens/login/login_screen.dart';

class SignUPScreen extends StatelessWidget {
  static String id = 'SignUPScreen';
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    var provider = Provider.of<LoginSignUpProvider>(context);
    return Container(
      alignment: Alignment.bottomCenter,
      //margin: EdgeInsets.only(bottom: screensize.height / 40),

      padding: EdgeInsets.symmetric(horizontal: screensize.width / 30),
      width: screensize.width / 1.13,
      constraints: BoxConstraints(
        minHeight: screensize.height / 1.6,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: screensize.height / 30,
          ),
          Text(
            'Relevant Systems',
            style: TextStyle(
                fontSize: 30,
                color: Colors.grey.shade800,
                fontFamily: 'Gotham-Medium',
                fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: screensize.height / 20,
          ),
          NormalInputField(
            labelText: 'User Name',
          ),
          Padding(padding: EdgeInsets.all(10)),
          NormalInputField(
            labelText: 'Email Address',
          ),
          Padding(padding: EdgeInsets.all(10)),
          PasswordInputField(
            labelText: 'Password',
          ),
          SizedBox(height: screensize.height / 40),
          MaterialButton(
            minWidth: screensize.width / 1.13 - screensize.width / 15,
            padding: EdgeInsets.symmetric(vertical: screensize.width / 20),
            child: Text(
              'SIGN UP',
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Gotham-Medium'),
            ),
            color: Theme.of(context).primaryColorDark,
            onPressed: () {},
          ),
          SizedBox(height: screensize.height / 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Already have an account?',
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 16)),
              FlatButton(
                child: Text('Sign in',
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),),onPressed: (){provider.toggleLoginSignUP=LoginScreen();},
              )
            ],
          ),
        ],
      ),
    );
  }
}
