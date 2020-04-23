import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({
    Key key,
  }) : super(key: key);

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
                onPressed: () {},
                child: Text("Cerrar Sesión ;-; "),
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
