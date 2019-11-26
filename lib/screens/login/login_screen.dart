import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relevant_systems/components/normalInputField.dart';
import 'package:relevant_systems/components/passwordInputField.dart';
import 'package:relevant_systems/providers/loginSignUpProvider.dart';
import 'package:relevant_systems/screens/signUp/signUp_screen.dart';
import 'package:relevant_systems/utils/validator.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var screensize = MediaQuery.of(context).size;
    var provider = Provider.of<LoginSignUpProvider>(context);
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: screensize.height / 25),
      padding: EdgeInsets.symmetric(horizontal: screensize.width / 30),
      width: screensize.width / 1.13,
      constraints: BoxConstraints(
        minHeight: screensize.height / 1.6,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Form(
        key: _formKey,
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
              height: screensize.height / 14,
            ),
            NormalInputField(
              labelText: 'Email Address',
              validator: (email)=>Validator.emailValidator(email),
              onChanged: (value) {
                provider.loginEmail = value;
              },
            ),
            Padding(padding: EdgeInsets.all(10)),
            PasswordInputField(
              labelText: 'Password',
              validator: (password)=>Validator.passwordValidator(password),
              onChanged: (value) {
                provider.loginPassword = value;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text('Forgot password ?'),
                )
              ],
            ),
            SizedBox(height: screensize.height / 30),
            MaterialButton(
              minWidth: screensize.width / 1.13 - screensize.width / 15,
              padding: EdgeInsets.symmetric(vertical: screensize.width / 20),
              child: Text(
                'LOGIN',
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Gotham-Medium'),
              ),
              color: Theme.of(context).primaryColorDark,
              onPressed: () {
                validate();
              },
            ),
            SizedBox(height: screensize.height / 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Don\'t have an account?',
                    style:
                        TextStyle(color: Colors.grey.shade400, fontSize: 16)),
                FlatButton(
                  child: Text('Create',
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold)),
                  onPressed: () {
                    provider.toggleLoginSignUP = SignUPScreen();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void validate() {
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
    }
  }
}
