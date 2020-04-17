import 'package:flutter/material.dart';
import 'package:temis/User/repository/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Container(
          padding: EdgeInsets.all(45.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Home Page",
                style: Theme.of(context).textTheme.title,
              ),
              RaisedButton(
                onPressed: () async {
                  await _auth.signOut();
                },
                child: Text("Cerrar Sesion"),
                //color: Color(0xff7ec7d0),
                shape: RoundedRectangleBorder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
