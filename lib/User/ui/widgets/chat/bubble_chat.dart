import 'package:flutter/material.dart';

class BubbleChat extends StatelessWidget {
  final bool isMe;
  final String message;
  final String time;
  String role;

  BubbleChat({this.isMe, this.message, this.role, this.time});

  Widget build(BuildContext context) {
    return Container(
      padding: isMe ? EdgeInsets.only(left: 20) : EdgeInsets.only(right: 20),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        padding: EdgeInsets.only(top: 5, left: 10, right: 10),
        child: Column(children: <Widget>[
          Row(
              mainAxisAlignment:
                  isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Column(
                    crossAxisAlignment: isMe
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: isMe ? Color(0xFFFFF7E4) : Color(0xFFE5F4F9),
                          borderRadius: isMe
                              ? BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  topLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(15),
                                )
                              : BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  topLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(0),
                                ),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(16, 8, 12, 8),
                          child: Column(
                            crossAxisAlignment: isMe
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: <Widget>[
                              isMe
                                  ? SizedBox()
                                  : Column(
                                      children: <Widget>[
                                        Text(
                                          _selectMessage(role),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.bold,
                                            color: _selectColor(role),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                              Text(
                                message,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(6, 4, 14, 4),
                        child: Text(
                          time,
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
        ]),
      ),
    );
  }

  Color _selectColor(String role) {
    var color;
    print("Color: $role");
    switch (role.toLowerCase()) {
      case "fiscalia":
        color = Color(0xFF0C6291);
        break;
      case "juez":
        color = Color(0xFF000004);
        break;
      case "secretario":
        color = Color(0xFFFC9F5B);
        break;
      case "defensa":
        color = Color(0xFF993955);
        break;
    }
    return color;
  }

  String _selectMessage(String role) {
    var message;
    switch (role.toLowerCase()) {
      case "fiscalia":
        message = "Jorge Hurtado (Fiscalía)";
        break;
      case "juez":
        message = "Marco Vircilio (Juez)";
        break;
      case "secretario":
        message = "Maria Emilia (Secretario)";
        break;
      case "defensa":
        message = "Jean Ramiro (Defensa)";
        break;
    }
    return message;
  }
}
