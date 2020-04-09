import 'package:flutter/material.dart';

class Startpage extends StatefulWidget {
  @override
  _StartpageState createState() => _StartpageState();
}

class _StartpageState extends State<Startpage> {
  TextEditingController _controller;
  final _formKey = GlobalKey<FormState>();

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
                  onPressed: () {
                    // validate that the name is not null
                    if (_formKey.currentState.validate()) {
                      print(_controller.text);
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
