import 'package:chatapp/data/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create custom user object;
  UserModel? _userFromFirebase(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // Auth change listener
  Stream<UserModel?> get user {
    return _auth
        .authStateChanges()
        // .map((User? user) => _userFromFirebase(user)); same as next line.
        .map(_userFromFirebase);
  }

  // Sign in guest/anonymous
  Future signInAnonymous() async {
    // Firebase.initializeApp();
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in email and password
  Future loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        return "invalid email";
      }
      if (e.code == "user-not-found") {
        return "user not found";
      }
      if (e.code == "wrong-password") {
        return "wrong password";
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Upload user information to cloud firestore
  void uploadUserInfo(String username, String email) {
    Map<String, String> data = {
      'username': username,
      'email': email,
    };
    FirebaseFirestore.instance.collection('users').add(data);
  }

  // Register with email and password
  Future registerWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      uploadUserInfo(username, email);
      return _userFromFirebase(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return "email in use";
      } else if (e.code == "invalid-email") {
        return "invalid email";
      } else if (e.code == "weak-password") {
        return "weak password";
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign out
  Future SignOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
