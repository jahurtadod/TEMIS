import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temis/User/model/user.dart';
import 'package:temis/User/repository/database_firestore.dart';

class NameUser extends StatefulWidget {
  @override
  _NameUserState createState() => _NameUserState();
}

class _NameUserState extends State<NameUser> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<User>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: Text(
              "Hola, ${snapshot.data.name}",
              style: Theme.of(context).textTheme.title,
            ),
          );
        } else {
          return Container(
            child: Text(
              "Hola,",
              style: Theme.of(context).textTheme.title,
            ),
          );
        }
      },
    );
  }
}
