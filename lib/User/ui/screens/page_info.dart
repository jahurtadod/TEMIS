import 'package:flutter/material.dart';

class PageInfo extends StatefulWidget {
  @override
  _PageInfoState createState() => _PageInfoState();
}

class _PageInfoState extends State<PageInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(40),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Información",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Theme.of(context).colorScheme.primaryVariant),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Los videojuegos educativos son una nueva experiencia de apoyar los procesos de aprendizaje.",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "TEMIS",
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Theme.of(context).colorScheme.primaryVariant),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Temis consiste en la toma de decisiones del usuario en base a los eventos que a contecen durante la simulación, dichas decisiones repercutirán en el resultado obtenido al finalizar la partida.",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "TITULACIÓN DE DERECHO",
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Theme.of(context).colorScheme.primaryVariant),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "La carrera de Derecho forma profesionales capaces de diseñar, planificar y generar procesos de intervención e innovación social en el campo jurídico.",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 40, 0, 40),
                    width: 150,
                    height: 150,
                    child: Image.asset('assets/temisito.png'),
                  ),
                  Text(
                    "Todos los derechos reservados UTPL 2020",
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.caption,
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
