import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:temis/User/model/user.dart';

import 'cloud_firestore_api.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreApi = CloudFirestoreAPI();

  void updateUserDataFirebase(User user) => _cloudFirestoreApi.updateUserData(user);
}
