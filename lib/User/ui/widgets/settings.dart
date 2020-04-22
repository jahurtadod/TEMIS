import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          child: RaisedButton(
            onPressed: () {},
            child: Text("Cerrar Sesión"),
          ),
        ),
        Spacer(),
        Container(
          child: RaisedButton(
            onPressed: () {},
            child: Text("Enlazar a Google"),
          ),
        ),
      ],
    );
  }
}
