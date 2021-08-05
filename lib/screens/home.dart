import 'package:flutter/material.dart';
import 'package:chatapp/data/people.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                print("search");
              },
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
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    border: null,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12))),
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: active.length,
                  itemBuilder: (context, index) {
                    return CircleAvatar(
                      backgroundColor: Colors.purple,
                      radius: 30,
                      child: Icon(Icons.search),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
