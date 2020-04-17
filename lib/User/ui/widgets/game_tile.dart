import 'package:flutter/material.dart';
import 'package:temis/User/model/game.dart';

class GameTile extends StatelessWidget {
  final Game game;

  const GameTile({this.game});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0.0),
      leading: Container(
        width: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            game.nameCase,
            style: Theme.of(context).textTheme.display1,
          ),
          Text(
            "17/02/2020",
            style: Theme.of(context).textTheme.display1,
          ),
        ],
      ),
      subtitle: Text(
        game.lastMessage,
        style: Theme.of(context).textTheme.display1,
      ),
    );
  }
}
