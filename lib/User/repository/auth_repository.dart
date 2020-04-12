import 'package:firebase_auth/firebase_auth.dart';
import 'package:temis/User/repository/firebase_auth_api.dart';

class AuthRepository {
  final _firtabaseAuthApi = FirebaseAuthAPI();

  Future<FirebaseUser> singInFirebaseAnon() => _firtabaseAuthApi.signIn();

  signOut() => _firtabaseAuthApi.signOut();
}
