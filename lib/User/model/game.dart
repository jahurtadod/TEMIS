import 'package:flutter/material.dart';
import 'package:temis/User/model/case.dart';

class Game {
  final String id;
  final bool active;
  final String nameCase;
  int points;
  CaseModel caseGame;
  final DateTime lastMessageDate;
  final String lastMessage;
  final String colorCase;
  final String role;
  final String idCase;
  Event judgment;
  //User userOwner;

  Game({
    Key key,
    this.active,
    this.nameCase,
    this.points,
    this.caseGame,
    this.lastMessageDate,
    this.lastMessage,
    this.colorCase,
    this.role,
    this.idCase,
    this.id,
    this.judgment,
  });
}
