import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relevant_systems/components/normalInputField.dart';
import 'package:relevant_systems/components/passwordInputField.dart';
import 'package:relevant_systems/providers/loginSignUpProvider.dart';
import 'package:relevant_systems/screens/login/login_screen.dart';
import 'package:relevant_systems/utils/validator.dart';

class SignUPScreen extends StatefulWidget {
  static String id = 'SignUPScreen';

  @override
  _SignUPScreenState createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {
  final _formKey = GlobalKey<FormState>();
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

      child:  Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: screensize.height / 40,
            ),
           Image.asset('assets/images/rel_sys_logo.png',height: screensize.height/6,fit: BoxFit.cover,),
           
            NormalInputField(
              labelText: 'User Name',
              validator: (value)=>Validator.textValidator(value),
              onChanged: (value) {
                provider.signUpUserName = value;
              },
            ),
            Padding(padding: EdgeInsets.all(10)),
            NormalInputField(
              labelText: 'Email Address',
              validator: (email)=>Validator.emailValidator(email),
              onChanged: (value) {
                provider.signUpEmail = value;
              },
            ),
            Padding(padding: EdgeInsets.all(10)),
            PasswordInputField(
              labelText: 'Password',
              validator: (password)=>Validator.passwordValidator(password),
              onChanged: (value) {
                provider.signUpPassword = value;
              },
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
              onPressed: () {
                print(provider.signUpPassword);
                print(provider.signUpUserName);
                print(provider.signUpEmail);
                validate();
              },
            ),
            SizedBox(height: screensize.height / 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Already have an account?',
                    style:
                        TextStyle(color: Colors.grey.shade400, fontSize: 16)),
                FlatButton(
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    provider.toggleLoginSignUP = LoginScreen();
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
