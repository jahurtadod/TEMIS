import 'package:flutter/material.dart';
import 'package:temis/User/model/case.dart';
import 'package:temis/User/model/game.dart';
import 'package:temis/User/repository/database_firestore.dart';
import 'package:temis/widgets/loading.dart';

class StarGame extends StatefulWidget {
  @override
  _StarGameState createState() => _StarGameState();
}

class _StarGameState extends State<StarGame> {
  @override
  Widget build(BuildContext context) {
    Game game = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(40),
              width: double.infinity,
              child: StreamBuilder<List<RouteModel>>(
                stream: DatabaseService()
                    .dataCaseRoute(game.caseGame.id, game.role),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Show case info to chat
                        Text(
                          game.caseGame.name,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Antecedentes del Caso",
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color:
                                  Theme.of(context).colorScheme.primaryVariant),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          game.caseGame.description.replaceAll("\\n", '\n'),
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.subtitle1,
                            children: [
                              TextSpan(
                                text: "Numero de finales posibles: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primaryVariant),
                              ),
                              TextSpan(
                                text: game.caseGame.numberPossibleEndings
                                    .toString(),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          child: RaisedButton(
                            onPressed: () {
                              if (snapshot.data.length != 0) {
                                game.caseGame.route = snapshot.data[0];
                                Navigator.of(context)
                                    .pushReplacementNamed('/chat',
                                        // Send the case information to the chat
                                        arguments: game);
                              } else {
                                Navigator.of(context)
                                    .pushReplacementNamed('/error_case');
                              }
                            },
                            child: Text("Comenzar"),
                            shape: RoundedRectangleBorder(),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Loading();
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
