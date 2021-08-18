import 'package:chatapp/services/search_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchFieldController = new TextEditingController();
  SearchService _searchHandler = new SearchService();
  QuerySnapshot? results;

  void initialSearch() {
    _searchHandler
        .getUserByUsername(_searchFieldController.text)
        .then((result) {
      setState(() {
        results = result;
      });
    });
  }

  Widget getSearchTile() {
    // print((results!).size);
    return results != null
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: (results!).size,
            itemBuilder: (context, index) {
              return SearchTile(
                username: results!.docs[index]['username'],
                email: results!.docs[index]['email'],
              );
            })
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back),
          ),
          elevation: 0,
          title: Text('Search'),
          centerTitle: true,
        ),
        body: Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: _searchFieldController,
                        decoration: InputDecoration(
                          border: null,
                          fillColor: Colors.transparent,
                          filled: true,
                          // prefixText: "Username:",
                          hintText: "Username",
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        initialSearch();
                      },
                    ),
                  ],
                ),
              ),
              getSearchTile(),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchTile extends StatelessWidget {
  String username;
  String email;

  SearchTile({
    required this.username,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 3.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                email,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Spacer(),
          TextButton(
            onPressed: () {},
            child: Text("View profile"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
