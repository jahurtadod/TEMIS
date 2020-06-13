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
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
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
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "TEMIS",
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Theme.of(context).colorScheme.primaryVariant),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Temis consiste en la toma de decisiones del usuario en base a los eventos que a contecen durante la simulación, dichas decisiones repercutirán en el resultado obtenido al finalizar la partida.",
                    style: Theme.of(context).textTheme.subtitle2,
                    textAlign: TextAlign.center,
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
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Creditos",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Theme.of(context).colorScheme.primaryVariant),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Estudio",
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Theme.of(context).colorScheme.primaryVariant),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Laboratotio Jupiter",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Desarrolladores",
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Theme.of(context).colorScheme.primaryVariant),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Jorge Hurtado",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Test",
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Theme.of(context).colorScheme.primaryVariant),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Jonathan Rosero",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Historia - Apartado legal",
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Theme.of(context).colorScheme.primaryVariant),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Ariana Medina",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Licencias",
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Theme.of(context).colorScheme.primaryVariant),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "MIT License",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 40, 0, 40),
                    width: 150,
                    height: 150,
                    child: Image.asset('assets/temisito.png'),
                  ),
                  Text(
                    "© Todos los derechos reservados UTPL 2020",
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
