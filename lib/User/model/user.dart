import 'package:flutter/material.dart';
import 'package:temis/User/model/game.dart';

class User {
  final String uid;
  final String name;
  final String email;
  final int numberGames;
  final int points;
  final List<Game> myGames;

  User({
    Key key,
    @required this.uid,
    @required this.name,
    this.email,
    this.numberGames,
    this.points,
    this.myGames,
  });
}
