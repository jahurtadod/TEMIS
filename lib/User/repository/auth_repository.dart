import 'package:firebase_auth/firebase_auth.dart';
import 'package:temis/User/repository/firebase_auth_api.dart';

class AuthRepository {
  final _firtabaseAuthApi = FirebaseAuthAPI();

  Future<FirebaseUser> singInFirebase() => _firtabaseAuthApi.signIn();
}
