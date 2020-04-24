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
          User user = snapshot.data;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Hola, ${user.name}",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "¿Estas listo para una nueva historia?",
                  style: Theme.of(context).textTheme.title.copyWith(
                        fontSize: 14,
                      ),
                ),
              ],
            ),
          );
        } else {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Hola,",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "¿Estas listo para una nueva historia?",
                  style: Theme.of(context).textTheme.title.copyWith(
                        fontSize: 14,
                      ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
