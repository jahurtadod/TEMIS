import 'package:flutter/material.dart';
import 'package:temis/User/model/user.dart';

class Profile extends StatelessWidget {
  final User user;
  const Profile({this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Perfil",
            style: Theme.of(context).textTheme.title,
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0.0),
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              child: Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.primary,
                size: 30,
              ),
            ),
            title: Text(
              user.name,
              style: Theme.of(context).textTheme.title.copyWith(fontSize: 15),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Score: ${user.points}",
                  style:
                      Theme.of(context).textTheme.title.copyWith(fontSize: 13),
                ),
                Text(
                  "Numero de Partidas: ${user.numberGames}",
                  style:
                      Theme.of(context).textTheme.title.copyWith(fontSize: 8),
                ),
              ],
            ),
          ),
          
          InkWell(
            child: Text(
              "Restablecer Datos",
              style: Theme.of(context).textTheme.caption,
            ),
          )
        ],
      ),
    );
  }
}
