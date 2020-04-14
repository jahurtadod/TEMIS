import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:temis/User/model/game.dart';
import 'package:temis/User/model/user.dart';
import 'package:temis/User/repository/auth_repository.dart';
import 'package:temis/User/repository/cloud_firestore_api.dart';
import 'package:temis/User/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  //Stream - Firebase
  Stream<FirebaseUser> streamFirebase =
      FirebaseAuth.instance.onAuthStateChanged;

  Stream<FirebaseUser> get authStatus => streamFirebase;

  // Use cases
  //Login
  Future<FirebaseUser> signIn() {
    return _auth_repository.singInFirebaseAnon();
  }

  //SignOut
  signOut() {
    _auth_repository.signOut();
  }

  //Register user
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(User user) =>
      _cloudFirestoreRepository.updateUserDataFirebase(user);
  //Add Game
  Future<void> updateGameDate(Game game) =>
      _cloudFirestoreRepository.updateGameDate(game);
  //Show Games
  Stream<QuerySnapshot> gamesListStream =
      Firestore.instance.collection(CloudFirestoreAPI().GAME).snapshots();
  Stream<QuerySnapshot> get gamesStream => gamesListStream;
  List<Game> buildGames(List<DocumentSnapshot> gamesListSnapshot) =>
      _cloudFirestoreRepository.buildGamesFirestore(gamesListSnapshot);

  @override
  void dispose() {}
}
