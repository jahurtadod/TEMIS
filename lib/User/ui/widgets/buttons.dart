import 'package:flutter/material.dart';

class Buttons {
  RaisedButton buttonType1(String pTexto, {Function pAccion}) {
    var button = RaisedButton(
        onPressed: () {
          pAccion();
        },
        textColor: Colors.yellow,
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xAF0D47A1),
                Color(0xFF1976D2),
                Color(0xFF42A5F5),
              ],
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Text(pTexto, style: TextStyle(fontSize: 20)),
        ));

    return button;
  }
}
