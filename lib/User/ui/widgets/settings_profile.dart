import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temis/User/model/user.dart';
import 'package:temis/User/repository/database_firestore.dart';
import 'package:temis/User/ui/widgets/profile.dart';
import 'package:temis/User/ui/widgets/settings.dart';
import 'package:temis/widgets/loading.dart';

class SettingsProfile extends StatefulWidget {
  @override
  _SettingsProfileState createState() => _SettingsProfileState();
}

class _SettingsProfileState extends State<SettingsProfile> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<User>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Container(
            color: Theme.of(context).colorScheme.background,
            height: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 30.0,
              horizontal: 45.0,
            ),
            child: Column(
              children: <Widget>[
                Profile(user: snapshot.data),
                Settings(),
              ],
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
