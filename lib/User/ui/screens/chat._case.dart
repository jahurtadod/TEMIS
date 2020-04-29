import 'package:flutter/material.dart';
import 'package:temis/User/model/game.dart';
import 'package:temis/User/ui/widgets/chat/bubble_chat.dart';
import 'package:temis/User/ui/widgets/chat/nav_bar_chat.dart';
import 'package:temis/User/ui/widgets/chat/write_message.dart';

class ChatCase extends StatefulWidget {
  @override
  _ChatCaseState createState() => _ChatCaseState();
}

class _ChatCaseState extends State<ChatCase> {
  List<BubbleChat> _message = <BubbleChat>[];

  @override
  Widget build(BuildContext context) {
    Game game = ModalRoute.of(context).settings.arguments;

    void _printMensaje(String tempText, String tempRole, bool isMe) {
      BubbleChat message = BubbleChat(
        message: tempText,
        isMe: isMe,
        role: tempRole,
      );
      setState(() {
        _message.insert(0, message);
      });
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              NavBarChat(game: game),
              Expanded(
                child: Container(
                  child: Scaffold(
                    body: ListView.builder(
                      itemCount: _message.length,
                      reverse: true,
                      itemBuilder: (context, int index) {
                        return _message[index];
                      },
                      addAutomaticKeepAlives: true,
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: 10),
                ),
              ),
              RaisedButton(
                child: Text("next"),
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  _printMensaje("Hola ....", "defensa", false);
                },
              ),
              // Spacer(),
              WriteMessage(),
            ],
          ),
        ),
      ),
    );
  }
}
