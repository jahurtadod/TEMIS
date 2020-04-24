import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temis/User/model/user.dart';
import 'package:temis/User/repository/database_firestore.dart';
import 'package:temis/User/ui/widgets/home/settings/settings_profile.dart';

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
        var name = "";
        if (snapshot.hasData) {
          name = snapshot.data.name;
        }
        return Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(40, 24, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Hola, $name",
                    style: Theme.of(context).textTheme.title,
                  ),
                  IconButton(
                    padding: EdgeInsets.all(0.0),
                    color: Theme.of(context).colorScheme.onPrimary,
                    icon: Icon(Icons.more_vert, size: 40.0),
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.black12,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                            child: SettingsProfile(),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "¿Estas listo para una nueva historia?",
                style: Theme.of(context).textTheme.subtitle,
              ),
            ],
          ),
        );
      },
    );
  }
}
