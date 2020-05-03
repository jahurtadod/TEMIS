import 'package:flutter/material.dart';

class CaseInactive extends StatefulWidget {
  @override
  _CaseInactiveState createState() => _CaseInactiveState();
}

class _CaseInactiveState extends State<CaseInactive> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(40),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 25),
                    child: Icon(
                      Icons.bubble_chart,
                      size: 100.0,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Container(
                    child: Text(
                      "Próximamente",
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Este caso aún no se encuentra disponible, te avisaremos cunado esté disponible.",
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    // padding: EdgeInsets.symmetric(horizontal: 40),
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Regresar"),
                      //color: Color(0xff7ec7d0),
                      shape: RoundedRectangleBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
