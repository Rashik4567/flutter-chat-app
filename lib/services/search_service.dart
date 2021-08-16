import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  getUserByUsername(String username) {
    return FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: username)
        .get();
  }
}
