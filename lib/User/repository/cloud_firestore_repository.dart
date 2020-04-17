import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temis/User/model/game.dart';
import 'package:temis/User/model/user.dart';

import 'cloud_firestore_api.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreApi = CloudFirestoreAPI();

  void updateUserDataFirebase(User user) =>
      _cloudFirestoreApi.updateUserData(user);
  Future<void> updateGameDate(Game game) =>
      _cloudFirestoreApi.updateGameData(game);
  List<Game> buildGamesFirestore(List<DocumentSnapshot> gamesListSnapshot) =>
      _cloudFirestoreApi.buildGames(gamesListSnapshot);
  Future<User> getUserFirestore(String uid) => _cloudFirestoreApi.dataUser(uid);

  // User dataUserFirebase(DocumentSnapshot userDataSnapshot) => _cloudFirestoreApi.dataUser(userDataSnapshot);
}
