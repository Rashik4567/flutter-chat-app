import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenWidget();
}

class _WelcomeScreenWidget extends State<WelcomeScreen> {
  int _pageCount = 4;
  final PageController _welcomeScreenController =
      PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Widget _indicator(bool isCurrent) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        height: 8,
        width: isCurrent ? 17 : 13,
        decoration: BoxDecoration(
          color: (isCurrent ? Colors.white : Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
      );
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
                _currentPage != _pageCount - 1
                    ? Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => print("Skip"),
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
                            "",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                Container(
                  height: 600.00,
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
                            image: AssetImage("assets/images/welcome.png"),
                            repeat: ImageRepeat.noRepeat,
                          ),
                          Text(
                            "Welcome to chatapp",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 40, right: 20, left: 20),
                            width: 500,
                            alignment: Alignment.center,
                            child: Center(
                              child: Text(
                                "Stay connected with your friends and family no matter where you are.",
                                style: TextStyle(
                                  fontSize: 21,
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
                              fontSize: 30,
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
                                  fontSize: 21,
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
                              fontSize: 30,
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
                                  fontSize: 21,
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
                              fontSize: 30,
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
                                  fontSize: 21,
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
                Padding(
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
                              onPressed: () {},
                            )
                          : TextButton(
                              child: Text(
                                "back",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {},
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
                              onPressed: () {},
                            )
                          : TextButton(
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {},
                            ),
                    ],
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
