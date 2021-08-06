import 'package:chatapp/data/user.dart';
import 'package:chatapp/screens/authenticate.dart';
import 'package:chatapp/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Controller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    if (user == null) {
      return AuthenticateScreen();
    } else {
      return HomePage();
    }
  }
}
