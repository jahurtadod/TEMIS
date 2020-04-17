import 'package:flutter/material.dart';
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
                      style: Theme.of(context).textTheme.title,
                    ),
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
                        validator: (value) => value.isEmpty
                            ? 'Para continuar debes ingresar un nombre'
                            : null,
                        cursorColor: Colors.orange,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xff7ec7d0)), // style text input
                        decoration: InputDecoration(
                          hintText: 'Ingresa tu nombre',
                          hintStyle: TextStyle(
                              fontSize: 14.0, color: Color(0xff7ec7d0)),
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
                          Future.delayed(Duration(seconds: 5), () async {
                            dynamic result = await _auth.signInAnon();
                            if (result == null) {
                              setState(() => loading = false);
                              print("Error Signing In");
                            } else {
                              print("Sign In ${result.uid}");
                            }
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
            // body: Container(
            //   child: RaisedButton(
            //     onPressed: () async {
            //       dynamic result = await _auth.signInAnon();
            //       if (result == null) {
            //         print("Error Signing In");
            //       } else {
            //         print("Sign In ${result.uid}");
            //       }
            //     },
            //     child: Text("Comenzar"),
            //     //color: Color(0xff7ec7d0),
            //     shape: RoundedRectangleBorder(),
            //   ),
            // ),
          );
  }
}
