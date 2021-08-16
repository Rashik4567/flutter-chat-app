import 'package:chatapp/screens/search.dart';
import 'package:chatapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/data/people.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          shadowColor: null,
          elevation: 0,
          backgroundColor: Colors.blue,
          title: Text("Chat app"),
          actions: [
            IconButton(
              icon: Icon(Icons.search_outlined),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
            ),
            IconButton(
              onPressed: () async {
                await _auth.SignOut();
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: _screenWidth,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    border: null,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
                child: Column(
                  children: [
                    Text(
                      "Active",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: active.length + 1,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: index == 0
                                ? Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.purple,
                                      radius: 30,
                                      child: IconButton(
                                        icon: Icon(Icons.search),
                                        onPressed: () {},
                                      ),
                                    ),
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.purple,
                                    radius: 30,
                                    child: Icon(Icons.person),
                                  ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 2, right: 2, bottom: 2),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "All chats",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: friends.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FriendsBuilder(friends[index]),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Row FriendsBuilder(friend) {
  return Row(
    children: [
      Flexible(
        flex: 2,
        child: CircleAvatar(
          child: IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              print("Profile");
            },
          ),
          radius: 30,
        ),
      ),
      Expanded(
        flex: 8,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: TextButton(
            child: Text(
              friend.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              print(friend.name);
            },
          ),
        ),
      ),
      Flexible(
        flex: 2,
        child: IconButton(
          onPressed: () {
            print("Settings");
          },
          icon: Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
