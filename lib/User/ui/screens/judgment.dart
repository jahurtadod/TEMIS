import 'package:flutter/material.dart';
import 'package:temis/User/model/case.dart';

class ScreenJudgment extends StatefulWidget {
  @override
  _ScreenJudgmentState createState() => _ScreenJudgmentState();
}

class _ScreenJudgmentState extends State<ScreenJudgment> {
  @override
  Widget build(BuildContext context) {
    Event event = ModalRoute.of(context).settings.arguments;
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
                      "SENTENCIA",
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    event.text,
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.subtitle,
                      children: [
                        TextSpan(
                          text: "Score: ",
                          style: Theme.of(context).textTheme.subtitle.copyWith(
                              color:
                                  Theme.of(context).colorScheme.primaryVariant),
                        ),
                        TextSpan(
                          text: "100 / 300",
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.subtitle,
                      children: [
                        TextSpan(
                          text: "Final: ",
                          style: Theme.of(context).textTheme.subtitle.copyWith(
                              color:
                                  Theme.of(context).colorScheme.primaryVariant),
                        ),
                        TextSpan(
                          text: "2 / 3",
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
                      child: Text("Comenzar otra aventura"),
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
