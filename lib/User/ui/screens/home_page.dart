import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:temis/User/bloc/bloc_user.dart';
import 'package:flutter/material.dart';
import 'package:temis/User/model/game.dart';
import 'package:temis/User/model/user.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserBloc userBloc;
  User user;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Container(
          padding: EdgeInsets.all(45.00),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder(
                stream: userBloc.streamFirebase,
                builder: (context, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return CircularProgressIndicator();
                    case ConnectionState.waiting:
                      return CircularProgressIndicator();
                    case ConnectionState.active:
                      return showNameUser(snapshot);

                    case ConnectionState.done:
                      return showNameUser(snapshot);
                  }
                },
              ),
              // Text(
              //   "Hola,",
              // ),
              // Text(
              //   "Casos Activos sddddd dfdf d fd df d dfdf d df df df df",
              //   style: Theme.of(context).textTheme.subtitle,
              // ),
              // Text(
              //   "Selecciona una audiencia",
              //   style: Theme.of(context).textTheme.subtitle,
              // ),
              // RaisedButton(
              //   onPressed: () => userBloc.signOut(),
              //   child: Text("Sin Out"),
              // ),
              RaisedButton(
                onPressed: () {
                  userBloc
                      .updateGameDate(Game(
                    active: true,
                    nameCase: "Audiencia 1",
                    points: 0,
                    caseGame: null,
                    lastMessage: "Te extraño ari",
                    lastMessageDate: DateTime.now(),
                    colorCase: "0xff7ec7d0",
                  ))
                      .whenComplete(() {
                    print("Subimos");
                  });
                },
                child: Text("Guardar partida"),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    StreamBuilder(
                      stream: userBloc.gamesStream,
                      builder: (context, AsyncSnapshot snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return CircularProgressIndicator();
                          case ConnectionState.waiting:
                            return CircularProgressIndicator();
                          case ConnectionState.active:
                            return showGamesAct(snapshot);

                          case ConnectionState.done:
                            return showGamesAct(snapshot);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showNameUser(AsyncSnapshot snapshot) {
    if (!snapshot.hasData) {
      print("no logeado");
      return Text(
        "Tienes que crear un perfil",
      );
    } else {
      print(snapshot.data.uid);
      return Text(
        "Hola, ${snapshot.data.uid} ",
      );
    }
  }

  Widget showGamesAct(AsyncSnapshot snapshot) {
    List<Game> games = userBloc.buildGames(snapshot.data.documents);
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: games.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            games[index].nameCase,
            style: Theme.of(context).textTheme.subtitle,
          ),
          subtitle: Text(
            games[index].lastMessage,
            style: Theme.of(context).textTheme.subtitle,
          ),
        );
      },
    );
  }
}
