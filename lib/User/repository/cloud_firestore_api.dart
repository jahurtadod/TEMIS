import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:temis/User/model/game.dart';
import 'package:temis/User/model/user.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String CASE = "cases";
  final String GAME = "games";

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  Future<void> updateGameData(Game game) async {
    CollectionReference refGames = _db.collection(GAME);
    await _auth.currentUser().then((FirebaseUser user) {
      refGames.add({
        'active': true,
        'name': game.nameCase,
        'points': game.points,
        'caseGame': game.caseGame,
        'lastMessage': game.lastMessage,
        'lastMessageDate': game.lastMessageDate,
        'colorCase': game.colorCase,
        'userOwner': _db.document("$USERS/${user.uid}"),
      }).then((DocumentReference dr) {
        dr.get().then((DocumentSnapshot snapshot) {
          DocumentReference refUsers = _db.collection(USERS).document(user.uid);
          refUsers.updateData({
            'myGames': FieldValue.arrayUnion(
                [_db.document("$GAME/${snapshot.documentID}")])
          });
        });
      });
    });
  }

  List<Game> buildGames(List<DocumentSnapshot> gamesListSnapshot) {
    List<Game> games = List<Game>();
    gamesListSnapshot.forEach((p) {
      games.add(Game(
          active: p.data['active'],
          nameCase: p.data['name'],
          points: p.data['points'],
          caseGame: p.data['caseGame'],
          lastMessageDate: (p.data['lastMessageDate'] as Timestamp).toDate(),
          lastMessage: p.data['lastMessage'],
          colorCase: p.data['colorCase']));
    });
    return games;
  }

  Future<User> dataUser(String uid) async {
    var ref = _db.collection(USERS).document("ZvTNDNqojtbmnxNpHr2UCeZ8GxU2");
    ref.get().then((doc) {
      if (doc.exists) {
        print("Si existe");
        print("${doc.data['uid']} + ${doc.data['name']}");
        return User(uid: doc.data['uid'], name: doc.data['name']);
      } else {
        print("No existe");
        return User(uid: null, name: null);
      }
    });
  }
}
