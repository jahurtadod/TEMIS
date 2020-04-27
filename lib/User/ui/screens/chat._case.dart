import 'package:flutter/material.dart';
import 'package:temis/User/model/game.dart';

class ChatCase extends StatefulWidget {
  @override
  _ChatCaseState createState() => _ChatCaseState();
}

class _ChatCaseState extends State<ChatCase> {
  @override
  Widget build(BuildContext context) {
    Game game = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 70,
                color: Theme.of(context).colorScheme.onSecondary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      padding: EdgeInsets.all(0.0),
                      color: Theme.of(context).colorScheme.primary,
                      icon: Icon(Icons.keyboard_arrow_left, size: 40.0),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.title.copyWith(
                              fontSize: 16,
                              color: Color(0xff505050),
                            ),
                        children: [
                          TextSpan(text: game.caseGame.name),
                          TextSpan(
                            text: "  Online ... ",
                            style:
                                Theme.of(context).textTheme.subtitle.copyWith(
                                      fontSize: 8,
                                      color: Color(0xff03A50E),
                                    ),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      padding: EdgeInsets.all(0.0),
                      color: Theme.of(context).colorScheme.primary,
                      icon: Icon(Icons.more_vert, size: 40.0),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text(
                "Audiencia",
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(),
              Text(
                "Description",
                style: Theme.of(context).textTheme.subtitle,
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 15),
                padding: EdgeInsets.fromLTRB(25, 2, 5, 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  color: Theme.of(context).colorScheme.primary,
                ),
                width: double.infinity,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Escribe un mensaje",
                      style: Theme.of(context).textTheme.title.copyWith(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                    ),
                    Container(
                      width: 40.0,
                      height: 40.0,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Image.asset('assets/send.png'),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
