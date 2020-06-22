import 'package:flutter/material.dart';
import 'package:temis/User/model/game.dart';

class ScreenJudgment extends StatefulWidget {
  @override
  _ScreenJudgmentState createState() => _ScreenJudgmentState();
}

class _ScreenJudgmentState extends State<ScreenJudgment> {
  @override
  Widget build(BuildContext context) {
    Game game = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(40),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Container(
                  //   padding: EdgeInsets.only(bottom: 25),
                  //   child: Icon(
                  //     Icons.thumb_up,
                  //     size: 100.0,
                  //     color: Theme.of(context).colorScheme.secondary,
                  //   ),
                  // ),
                  Container(
                    child: Text(
                      "Resolución Judicial:",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    game.judgment.text.replaceAll("\\n", '\n'),
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
                          text: "Score: ",
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color:
                                  Theme.of(context).colorScheme.primaryVariant),
                        ),
                        TextSpan(
                          text:
                              "${game.points} / ${game.caseGame.route.pointsMax}",
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.subtitle1,
                      children: [
                        TextSpan(
                          text: "Final: ",
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color:
                                  Theme.of(context).colorScheme.primaryVariant),
                        ),
                        game.caseGame.route.role == "FISCALIA"
                            ? TextSpan(
                                text:
                                    "${game.judgment.numberEnding} / ${game.caseGame.route.numberPossibleEndings} - Ruta: FISCALÍA",
                              )
                            : TextSpan(
                                text:
                                    "${game.judgment.numberEnding} / ${game.caseGame.route.numberPossibleEndings} - Ruta: ${game.caseGame.route.role}",
                              )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Container(
                  //   // padding: EdgeInsets.symmetric(horizontal: 40),
                  //   width: double.infinity,
                  //   child: RaisedButton(
                  //     onPressed: () {
                  //       Navigator.pop(context);
                  //     },
                  //     child: Text("Comenzar de nuevo"),
                  //     //color: Color(0xff7ec7d0),
                  //     shape: RoundedRectangleBorder(),
                  //   ),
                  // ),
                  Container(
                    // padding: EdgeInsets.symmetric(horizontal: 40),
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Comenzar otra audiencia"),
                      //color: Color(0xff7ec7d0),
                      shape: RoundedRectangleBorder(),
                    ),
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
