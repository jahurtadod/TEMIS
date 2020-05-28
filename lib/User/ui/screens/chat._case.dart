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
  List<BubbleChat> _message = <BubbleChat>[];
  String _idEventTemp;
  bool optionActive = false;
  bool load = false;
  Event eventTempOptions;
  int pointsCase = 0;

  // Prueba
  bool star = true;
  // bool stop = true;
  // String time = "00:00:00";
  // var swacth = Stopwatch();
  // final dur = const Duration(seconds: 1);

  // void startTimer() {
  //   Timer(dur, keeprunning);
  // }

  // void keeprunning() {
  //   if (swacth.isRunning) {
  //     startTimer();
  //     BubbleChat message = BubbleChat(
  //       message: "tempText",
  //       isMe: false,
  //       role: "defensa",
  //     );
  //     setState(() {
  //       _message.insert(0, message);
  //     });
  //   }
  //   setState(() {
  //     time = swacth.elapsed.inHours.toString().padLeft(2, "0") +
  //         ":" +
  //         (swacth.elapsed.inMinutes % 60).toString().padLeft(2, "0") +
  //         ":" +
  //         (swacth.elapsed.inSeconds % 60).toString().padLeft(2, "0");
  //   });
  // }

  // void starGame() {
  //   setState(() {
  //     stop = false;
  //   });
  //   swacth.start();
  //   startTimer();
  // }

  // void stopGame() {
  //   setState(() {
  //     stop = true;
  //   });
  //   swacth.stop();
  // }

  @override
  void initState() {
    // _idEventTemp = game.caseGame.route.idFirstEvent;
    super.initState();
  }

  // @override
  // void dispose() {
  //   swacth.stop();
  //   stop = true;
  //   super.dispose();
  //   print('dispose');
  // }

  // @override
  // void deactivate() {
  //   super.deactivate();
  //   stop = true;
  //   swacth.stop();
  //   this method not called when user press android back button or quit
  //   print('deactivate');
  // }

  void _createOptionChat(Event event) {
    setState(() {
      eventTempOptions = event;
      optionActive = optionActive ? false : true;
    });
    print(optionActive);
  }

  void _createBubbleChat(String tempText, String tempRole, bool isMe) {
    setState(() {
      load = true;
    });

    Future.delayed(Duration(seconds: 3), () async {}).whenComplete(() {
      setState(() {
        load = false;
        _message.insert(
            0,
            BubbleChat(
              message: tempText,
              isMe: isMe,
              role: tempRole,
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

          Navigator.of(context)
              .pushReplacementNamed('/judgment', arguments: event);
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
                        margin: EdgeInsets.only(bottom: 10),
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
                                  child: Text(
                                    "Siguiente >>",
                                    style: Theme.of(context)
                                        .textTheme
                                        .title
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
                    optionActive
                        ? WriteMessage(
                            options: eventTempOptions.sequence,
                            onSelectOption: (newId, newText, points) {
                              _createBubbleChatOption(
                                  newText, game.caseGame.route.role, true);
                              setState(() {
                                optionActive = false;
                                _idEventTemp = newId;
                                pointsCase += points;
                              });
                              selectEvent();
                            },
                          )
                        : Container(),
                    // Expanded(
                    //   child: Container(
                    //     alignment: Alignment.center,
                    //     color: Colors.cyan,
                    //     child: Text(time),
                    //   ),
                    // ),
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 50),
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: <Widget>[
                    //       RaisedButton(
                    //         child: Text("start"),
                    //         padding: EdgeInsets.all(0.0),
                    //         onPressed: star ? starGame : null,
                    //       ),
                    //       RaisedButton(
                    //         child: Text("stop"),
                    //         padding: EdgeInsets.all(0.0),
                    //         onPressed: stop ? null : stopGame,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Spacer(),
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
