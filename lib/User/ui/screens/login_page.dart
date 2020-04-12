import 'package:temis/User/model/user.dart';
import 'package:temis/User/ui/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:temis/User/bloc/bloc_user.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _controller;
  final _formKey = GlobalKey<FormState>();
  UserBloc userBloc;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dipose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return _home();
  }

  Widget _home() {
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return _login();
        } else {
          return HomePage();
        }
      },
    );
  }

  Widget _login() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Container(
            padding: EdgeInsets.all(45.00),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
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
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _controller,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Para continuar debes ingresar un nombre';
                      }
                    },
                    cursorColor: Colors.orange,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xff7ec7d0)), // style text input
                    decoration: InputDecoration(
                      hintText: 'Ingresa tu nombre',
                      hintStyle:
                          TextStyle(fontSize: 14.0, color: Color(0xff7ec7d0)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff7ec7d0)),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                RaisedButton(
                  onPressed: () async {
                    // validate that the name is not null
                    if (_formKey.currentState.validate()) {
                      userBloc.signIn().then((FirebaseUser user) {
                        userBloc.updateUserData(User(
                          uid: user.uid,
                          name: _controller.text,
                        ));
                      });
                    }
                  },
                  child: Text("Comenzar"),
                  //color: Color(0xff7ec7d0),
                  shape: RoundedRectangleBorder(),
                ),
                Spacer(
                  flex: 5,
                ),
              ],
            )),
      ),
    );
  }
}
