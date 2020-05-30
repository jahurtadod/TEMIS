import 'package:flutter/material.dart';

class BubbleChat extends StatelessWidget {
  final bool isMe;
  final String message;
  String role;

  // BubbleChat({this.message, this.isMe, this.role, this.myRole});
  BubbleChat({this.isMe, this.message, this.role});

  Widget build(BuildContext context) {
    return Container(
      padding: isMe ? EdgeInsets.only(left: 20) : EdgeInsets.only(right: 20),
      child: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                child: Column(children: <Widget>[
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: isMe
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  isMe ? Color(0xFFFFF7E4) : Color(0xFFE5F4F9),
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
                              child: Text(
                                message,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  // color: IndevColors.black,
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }

  Color _selectColor(String role) {
    var color;
    print("Color: $role");
    switch (role.toLowerCase()) {
      case "fiscalia":
        color = Color(0xFF7DB1FD);
        break;
      case "juez":
        color = Color(0xFF7FF100);
        break;
      case "secretario":
        color = Color(0xFF8D88CE);
        break;
      case "defensa":
        color = Color(0xFFEACACA);
        break;
    }
    return color;
  }
}
