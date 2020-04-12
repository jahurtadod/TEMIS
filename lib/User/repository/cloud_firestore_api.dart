import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temis/User/model/user.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String CASE = "cases";

  final Firestore _db = Firestore.instance;

  void updateUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'numberGames': user.numberGames,
      'points': user.points,
      'myGames': user.myGames,
      'lastSignIn': DateTime.now(),
    }, merge: true);
  }
}
