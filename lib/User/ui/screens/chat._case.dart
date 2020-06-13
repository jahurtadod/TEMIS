import 'dart:math';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temis/User/model/case.dart';
import 'package:temis/User/model/game.dart';
import 'package:temis/User/model/user.dart';
import 'package:temis/User/repository/database_firestore.dart';
import 'package:temis/User/ui/widgets/chat/bubble_chat.dart';
import 'package:temis/User/ui/widgets/chat/nav_bar_chat.dart';
import 'package:temis/User/ui/widgets/chat/write_message.dart';
import 'package:temis/widgets/loading.dart';
import 'package:temis/widgets/loading_message.dart';

class ChatCase extends StatefulWidget {
  @override
  _ChatCaseState createState() => _ChatCaseState();
}

class _ChatCaseState extends State<ChatCase> {
  List<BubbleChat> _message = <BubbleChat>[
    BubbleChat(
      message:
          "Hola, yo soy Temisito.\nVoy a acompañarte en esta aventura dale a siguiente para mostrar los diálogos.",
      isMe: true,
      role: "temis",
      time: DateFormat.jm().format(DateTime.now()),
    ),
  ];

  Event eventTempOptions;
  String _idEventTemp;
  bool optionActive = false;
  bool nextActive = false;
  bool load = false;
  int pointsCase = 0;

  void _createOptionChat(Event event) {
    setState(() {
      eventTempOptions = event;
      optionActive = optionActive ? false : true;
      nextActive = nextActive ? false : true;
    });
    print(optionActive);
    print(nextActive);
  }

  void _createBubbleChat(String tempText, String tempRole, bool isMe) {
    setState(() {
      load = true;
      nextActive = true;
    });

    Future.delayed(
            Duration(
                milliseconds: Random().nextInt(2000) + 500), // Animation Time
            () async {})
        .whenComplete(() {
      setState(() {
        load = false;
        nextActive = false;
        _message.insert(
            0,
            BubbleChat(
              message: tempText,
              isMe: isMe,
              role: tempRole,
              time: DateFormat.jm().format(DateTime.now()),
            ));
      });
    });
  }

  void _createBubbleChatOption(String tempText, String tempRole, bool isMe) {
    setState(() {
      _message.insert(
          0,
          BubbleChat(
            message: tempText,
            isMe: isMe,
            role: tempRole,
            time: DateFormat.jm().format(DateTime.now()),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    Game game = ModalRoute.of(context).settings.arguments;
    List<Event> events = <Event>[];
    String _firstID = game.caseGame.route.idFirstEvent;
    final user = Provider.of<User>(context);

    void _updatePoints() async {
      await DatabaseService(uid: user.uid).updateUserPoints(pointsCase);
    }

    void selectEvent() {
      if (_idEventTemp == null) {
        _idEventTemp = _firstID;
      }
      var event = events.firstWhere((event) => event.id == _idEventTemp);
      print(event.type);
      print("Final: ${event.numberEnding}");
      switch (event.type) {
        case "DIALOGUE":
          _createBubbleChat(
              event.text, event.role, game.caseGame.route.role == event.role);
          _idEventTemp = event.sequence.first.next.documentID;
          print(_idEventTemp);
          break;
        case "OPTION":
          print("opcion");
          _createOptionChat(event);
          print(_idEventTemp);
          break;
        case "JUDGMENT":
          _updatePoints();
          print("Validar Points");
          game.judgment = event;
          game.points = pointsCase;
          Navigator.of(context)
              .pushReplacementNamed('/judgment', arguments: game);
          print("sentencia");
          break;
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        body: StreamBuilder<List<Event>>(
          stream: DatabaseService()
              .eventsRoute(game.caseGame.id, game.caseGame.route.id),
          builder: (context, snapshot) {
            events = snapshot.data;
            if (snapshot.hasData) {
              return Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    NavBarChat(game: game),
                    // Show chat bubbles
                    Expanded(
                      child: Container(
                        child: ListView.builder(
                          itemCount: _message.length,
                          reverse: true,
                          itemBuilder: (context, int index) {
                            return _message[index];
                          },
                          addAutomaticKeepAlives: true,
                        ),
                        margin: EdgeInsets.only(bottom: 16),
                      ),
                    ),
                    load ? LoadingMessage() : Container(),
                    optionActive
                        ? Container()
                        : Container(
                            padding: EdgeInsets.only(right: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    selectEvent();
                                  },
                                  child: nextActive
                                      ? Container()
                                      : Text(
                                          "Siguiente >>",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5
                                              .copyWith(
                                                fontSize: 16,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                        ),
                                )
                              ],
                            ),
                          ),
                    // Show the heading to select an option
                    optionActive
                        ? WriteMessage(
                            options: eventTempOptions.sequence,
                            onSelectOption: (newId, newText, points) {
                              _createBubbleChatOption(
                                  newText, game.caseGame.route.role, true);
                              setState(() {
                                optionActive = false;
                                nextActive = false;
                                _idEventTemp = newId;
                                pointsCase += points;
                              });
                              selectEvent();
                            },
                          )
                        : Container(),
                  ],
                ),
              );
            } else {
              return Loading();
            }
          },
        ),
      ),
    );
  }
}
