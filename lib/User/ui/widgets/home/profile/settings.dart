import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temis/User/repository/auth.dart';

class Settings extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Container(
        //   padding: EdgeInsets.only(top: 5, bottom: 30),
        //   child: InkWell(
        //     child: Text(
        //       "Restablecer Datos",
        //       style: Theme.of(context).textTheme.caption,
        //     ),
        //   ),
        // ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              flex: 4,
              child: RaisedButton(
                onPressed: () async {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/', (Route<dynamic> route) => false);
                  await _auth.signOut();
                },
                child: Text("Restablecer Datos"),
                color: Color(0xffDB504A),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              flex: 2,
              child: RaisedButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                child: Text("Salir"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
