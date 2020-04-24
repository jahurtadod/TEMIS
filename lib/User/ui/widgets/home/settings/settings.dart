import 'package:flutter/material.dart';
import 'package:temis/User/repository/auth.dart';

class Settings extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 5, bottom: 30),
          child: InkWell(
            child: Text(
              "Restablecer Datos",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              flex: 3,
              child: RaisedButton(
                onPressed: () async {
                  await _auth.signOut();
                },
                child: Text("Cerrar Sesión ;-;"),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 3,
              child: RaisedButton(
                onPressed: () {},
                child: Text("Enlazar a Google"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _auth {}
