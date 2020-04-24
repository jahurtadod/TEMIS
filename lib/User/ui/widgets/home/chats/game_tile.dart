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
          border: Border.all(
            width: 2,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          padding: EdgeInsets.all(0.0),
          color: Theme.of(context).colorScheme.onSecondary,
          icon: Icon(Icons.person_outline),
          onPressed: () {},
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            game.nameCase,
            style: Theme.of(context).textTheme.display1.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
          Text(
            "17/02/2020",
            style: Theme.of(context).textTheme.display1.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
        ],
      ),
      subtitle: Text(
        game.lastMessage,
        style: Theme.of(context).textTheme.display1.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
      ),
    );
  }
}
