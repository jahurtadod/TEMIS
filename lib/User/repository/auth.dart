import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:temis/User/model/user.dart';
import 'package:temis/User/repository/database_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid, name: null) : null;
  }

  // Auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // Sign in anon
  Future signInAnon(User user) async {
    try {
      AuthResult result = await _auth.signInAnonymously();

      // Create a new document for the user with the uid
      await DatabaseService(uid: result.user.uid).updateUserData(user);

      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with google

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut().then((onValue) => print("cesion cerrada"));
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
