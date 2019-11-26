import 'package:flutter/material.dart';
import 'package:relevant_systems/screens/login/login_screen.dart';

class LoginSignUpProvider with ChangeNotifier{
  Widget _signUpOrLogin=LoginScreen();

  set toggleLoginSignUP(Widget value){
    _signUpOrLogin=value;
    notifyListeners();
  }

  get readSignUpOrLogin => _signUpOrLogin;

}