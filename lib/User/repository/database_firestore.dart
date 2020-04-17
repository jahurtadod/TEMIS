import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temis/User/model/game.dart';
import 'package:temis/User/model/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // Collection reference
  final CollectionReference gamesCollecction =
      Firestore.instance.collection('games');

  final CollectionReference usersCollecction =
      Firestore.instance.collection('users');

  //
  Future updateUserData(User user) async {
    return await gamesCollecction.document(uid).setData({
      'uid': uid,
      'name': user.name,
      'email': user.email,
      'numberGames': user.numberGames,
      'points': user.points,
      'myGames': user.myGames,
      'lastSignIn': DateTime.now(),
    });
  }

  // Get User Stream
  Stream<DocumentSnapshot> get user {
    return usersCollecction
        .document("ZvTNDNqojtbmnxNpHr2UCeZ8GxU2")
        .snapshots();
  }

  // Get Games Stream
  Stream<List<Game>> get gamesUser {
    return gamesCollecction.snapshots().map(_gamesListFromSnapshot);
  }

  // Games List from snapshot
  List<Game> _gamesListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Game(
        active: doc.data['active'],
        nameCase: doc.data['name'],
        points: doc.data['points'],
        caseGame: doc.data['caseGame'],
        lastMessageDate: (doc.data['lastMessageDate'] as Timestamp).toDate(),
        lastMessage: doc.data['lastMessage'],
        colorCase: doc.data['colorCase'],
      );
    }).toList();
  }
}
