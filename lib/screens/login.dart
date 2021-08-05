import 'package:chatapp/screens/signup.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flash/flash.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _loginFormKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    final _displayWidth = MediaQuery.of(context).size.width;

    void displayFlash() {
      showFlash(
          duration: Duration(seconds: 3),
          context: context,
          builder: (context, controller) {
            return Flash(
              controller: controller,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  width: _displayWidth,
                  child: Text(
                    "Logging in...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              position: FlashPosition.bottom,
              behavior: FlashBehavior.floating,
              // alignment: Alignment.bottomCenter,
              backgroundColor: Colors.black,
              useSafeArea: true,
              borderRadius: BorderRadius.circular(1),
            );
          });
    }

    void _handleLogin() {
      displayFlash();
      String? email = _email;
      String? password = _password;
      print("Logging in with email: $email, password: $password");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.cyan,
                Colors.blue,
                Colors.deepPurple,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: TextButton(
                          child: Text(
                            "Visit site",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Center(
                    child: ListView(
                      shrinkWrap: true,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "Sign in to your account",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Form(
                            key: _loginFormKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      this.setState(() {
                                        _email = value;
                                      });
                                    },
                                    cursorColor: Colors.black,
                                    expands: false,
                                    // textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: null,
                                      fillColor: Colors.white,
                                      filled: true,
                                      // prefixText: "Username:",
                                      hintText: "Email",
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          !EmailValidator.validate(value)) {
                                        return 'Invalid email.';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      this.setState(() {
                                        _password = value;
                                      });
                                    },
                                    cursorColor: Colors.black,
                                    expands: false,
                                    // textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: null,
                                      fillColor: Colors.white,
                                      filled: true,
                                      // prefixText: "Username:",
                                      hintText: "Password",
                                    ),
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value.length < 8) {
                                        return 'Invalid password.';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: TextButton(
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (_loginFormKey.currentState!
                                          .validate()) {
                                        _handleLogin();
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: TextButton(
                    child: Text(
                      "Or sign up instead",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
