import 'package:flutter/material.dart';
import 'package:temis/User/model/user.dart';
import 'package:temis/User/repository/auth.dart';
import 'package:temis/widgets/loading.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  TextEditingController _controller;
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

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
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
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
                    "Bienvenido,\nEstas listo para esta nueva experiencia de aprendizaje.",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    "Nombre del perfil",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _controller,
                      validator: (value) => value.isEmpty
                          ? 'Para continuar debes ingresar un nombre'
                          : null,
                      cursorColor: Colors.orange,
                      maxLines: 1,
                      style:
                          TextStyle(fontSize: 16.0, color: Color(0xff7ec7d0)),
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
                        setState(() => loading = true);
                        // Future.delayed(Duration(seconds: 5), () async {
                        dynamic result =
                            await _auth.signInAnon(// Login Anonymous
                                User(uid: null, name: _controller.text));
                        if (result == null) {
                          setState(() => loading = false);
                          print("Error Signing In");
                        } else {
                          print("Sign In ${result.uid}");
                        }
                        // });
                      }
                    },
                    child: Text("Comenzar"),
                    shape: RoundedRectangleBorder(),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
          );
  }
}
