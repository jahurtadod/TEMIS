import 'package:flutter/material.dart';
import 'package:temis/Case/model/case.dart';

class Game {
  final String id;
  final bool active;
  final String nameCase;
  final int points;
  final Case caseGame;
  final DateTime lastMessageDate;
  final String lastMessage;
  final String colorCase;
  //User userOwner;

  Game({
    Key key,
    @required this.active,
    @required this.nameCase,
    @required this.points,
    @required this.caseGame,
    @required this.lastMessageDate,
    @required this.lastMessage,
    @required this.colorCase,
    //this.userOwner,
    this.id,
  });
}
