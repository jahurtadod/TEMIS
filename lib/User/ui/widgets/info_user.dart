import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temis/User/model/user.dart';

class InfoUser extends StatefulWidget {
  @override
  _InfoUserState createState() => _InfoUserState();
}

class _InfoUserState extends State<InfoUser> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // print(user.uid);
    // for (var doc in user.documents) {
    //   print(doc.data);
    // }
    return Container(
      child: Text(
        "Hola, ${user.name}",
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
