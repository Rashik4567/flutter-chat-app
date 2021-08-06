import 'package:chatapp/screens/login.dart';
import 'package:chatapp/screens/signup.dart';
import 'package:flutter/material.dart';

class AuthenticateScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthenticateScreen> {
  bool signInPage = true;

  void changeScreen() {
    setState(() {
      signInPage = !signInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (signInPage) {
      return LoginScreen(screenChangeHandler: changeScreen);
    } else {
      return SignupScreen(screenChangeHandler: changeScreen);
    }
  }
}
