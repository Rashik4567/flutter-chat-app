import 'package:chatapp/data/user.dart';
import 'package:chatapp/screens/welcome.dart';
import 'package:chatapp/services/auth.dart';
import 'package:chatapp/controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isNew = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isNew = prefs.getBool("isNew") ?? true;
  await Firebase.initializeApp();
  runApp(ChatApp());
}

void welcomeScreenController() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("isNew", false);
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isNew
            ? WelcomeScreen(
                welcomeScreenController: welcomeScreenController,
              )
            : Controller(),
      ),
    );
  }
}
