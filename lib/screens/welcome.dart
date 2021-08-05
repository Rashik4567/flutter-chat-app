import 'dart:ffi';

import 'package:chatapp/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenWidget();
}

class _WelcomeScreenWidget extends State<WelcomeScreen> {
  int _pageCount = 4;
  final PageController _welcomeScreenController =
      PageController(initialPage: 0, viewportFraction: 1);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size.width;
    final _screenSizeHeight = MediaQuery.of(context).size.height;

    double? _titleFontSize = _screenSizeHeight > 700 ? 30.0 : 20.0;
    double? _textFontSize = _screenSizeHeight > 700 ? 21.0 : 17.0;

    Widget _indicator(bool isCurrent) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 350),
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        height: 8,
        width: isCurrent ? 17 : 13,
        decoration: BoxDecoration(
          color: (isCurrent ? Colors.white : Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
      );
    }

    void _signInPage() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }

    List<Widget> _buildPageIndicator() {
      List<Widget> pagelist = [];
      for (int i = 0; i < _pageCount; i++) {
        pagelist.add(i == _currentPage ? _indicator(true) : _indicator(false));
      }
      return pagelist;
    }

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 1,
                  child: _currentPage != _pageCount - 1
                      ? Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              _welcomeScreenController.animateToPage(
                                  _pageCount - 1,
                                  duration: Duration(microseconds: 200),
                                  curve: Curves.ease);
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () => print("Home"),
                            child: Text(
                              "Visit site",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    // height: 600.00,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _welcomeScreenController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              height: _screenSizeHeight * (2 / 5),
                              image: AssetImage("assets/images/welcome.png"),
                              repeat: ImageRepeat.noRepeat,
                            ),
                            Text(
                              "Welcome to chatapp",
                              style: TextStyle(
                                fontSize: _titleFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(top: 30, right: 20, left: 20),
                              width: _screenSize,
                              alignment: Alignment.center,
                              child: Center(
                                child: Text(
                                  "Stay connected with your friends and family no matter where you are.",
                                  style: TextStyle(
                                    fontSize: _textFontSize,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Contact with your friends like they are near you.",
                              style: TextStyle(
                                fontSize: _titleFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 40,
                              ),
                              width: 500,
                              alignment: Alignment.center,
                              child: Center(
                                child: Text(
                                  "Experience the high quality chat features and video and audio calls.",
                                  style: TextStyle(
                                    fontSize: _textFontSize,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "No lag video and audio calls even in slower connections.",
                              style: TextStyle(
                                fontSize: _titleFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 40,
                              ),
                              width: 500,
                              alignment: Alignment.center,
                              child: Center(
                                child: Text(
                                  "Leave your experience to our super optimized algorithoms and servers. Just enjoy the moment.",
                                  style: TextStyle(
                                    fontSize: _textFontSize,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Lets get started.",
                              style: TextStyle(
                                fontSize: _titleFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 40,
                              ),
                              width: 500,
                              alignment: Alignment.center,
                              child: Center(
                                child: Text(
                                  "Please log in to get started.",
                                  style: TextStyle(
                                    fontSize: _textFontSize,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _currentPage == 0
                            ? TextButton(
                                child: Text(
                                  "back",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                onPressed: null,
                              )
                            : TextButton(
                                child: Text(
                                  "back",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  _welcomeScreenController.animateToPage(
                                      _currentPage - 1,
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.ease);
                                },
                              ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _buildPageIndicator(),
                          ),
                        ),
                        _currentPage == _pageCount - 1
                            ? TextButton(
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: _signInPage,
                              )
                            : TextButton(
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  _welcomeScreenController.animateToPage(
                                      _currentPage + 1,
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.ease);
                                },
                              ),
                      ],
                    ),
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
