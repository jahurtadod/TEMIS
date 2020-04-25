import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temis/User/model/case.dart';
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

  final CollectionReference casesCollecction =
      Firestore.instance.collection('cases');

  //
  Future updateUserData(User user) async {
    return await usersCollecction.document(uid).setData({
      'uid': uid,
      'name': user.name,
      'email': user.email,
      'numberGames': 0,
      'points': 0,
      'myGames': user.myGames,
      'lastSignIn': DateTime.now(),
    });
  }

  // Get User Stream
  Stream<User> get user {
    return usersCollecction.document(uid).snapshots().map((doc) {
      return User(uid: doc.data['uid'], name: doc.data['name']);
    });
  }

  // Get userData stream
  Stream<User> get userData {
    return usersCollecction
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }

  // UserData from snapshot
  User _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return User(
      uid: uid,
      name: snapshot.data['name'],
      email: snapshot.data['email'],
      numberGames: snapshot.data['numberGames'],
      points: snapshot.data['points'],
      myGames: snapshot.data['myGames'],
    );
  }

  // Get Games Stream
  Stream<List<Game>> get gamesUser {
    return gamesCollecction.limit(2).snapshots().map(_gamesListFromSnapshot);
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

  // Stream Availables Cases
  Stream<List<CaseModel>> get cases {
    return casesCollecction.snapshots().map(_casesListFromSnapshot);
  }

  List<CaseModel> _casesListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return CaseModel(
        description: doc.data["description"],
        name: doc.data["name"],
        pointsMax: doc.data["pointsMax"],
        numberRoute: doc.data["numberRoute"],
      );
    }).toList();
  }
}
