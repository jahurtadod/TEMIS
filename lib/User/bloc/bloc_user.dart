import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:temis/User/repository/auth_repository.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  //Stream - Firebase
  Stream<FirebaseUser> streamFirebase =
      FirebaseAuth.instance.onAuthStateChanged;
    
  Stream<FirebaseUser> get authStatus => streamFirebase;

  //Use cases
  //Login
  Future<FirebaseUser> signIn() {
    return _auth_repository.singInFirebaseAnon();
  }

  @override
  void dispose() {}
}
