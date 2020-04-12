import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> signIn() async {
    AuthResult result = await _auth.signInAnonymously();
    print(result.user);
    return result.user;
  }

  signOut() async {
    await _auth.signOut().then((onValue) => print("cesion cerrada"));
  }
}
