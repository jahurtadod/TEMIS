import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:temis/User/bloc/bloc_user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Spacer(
              flex: 5,
            ),
            Text(
                "Bienvenido,\nEstas listo para esta nueva experiencia de aprendizaje."),
            Spacer(
              flex: 1,
            ),
            Text(
              "Nombre del perfil",
              style: Theme.of(context).textTheme.subtitle,
            ),
            RaisedButton(
              onPressed: () => userBloc.signOut(),
              child: Text("Sin Out"),
            ),
          ],
        ),
      ),
    );
  }
}
