import 'package:flutter/material.dart';
import 'package:temis/User/model/game.dart';

class NavBarChat extends StatelessWidget {
  const NavBarChat({
    Key key,
    @required this.game,
  }) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 70,
      color: Theme.of(context).colorScheme.onSecondary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            padding: EdgeInsets.all(0.0),
            color: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.keyboard_arrow_left, size: 40.0),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.title.copyWith(
                    fontSize: 16,
                    color: Color(0xff505050),
                  ),
              children: [
                TextSpan(text: game.caseGame.name),
                TextSpan(
                  text: "  Online ... ",
                  style: Theme.of(context).textTheme.subtitle.copyWith(
                        fontSize: 8,
                        color: Color(0xff03A50E),
                      ),
                )
              ],
            ),
          ),
          Spacer(),
          IconButton(
            padding: EdgeInsets.all(0.0),
            color: Theme.of(context).colorScheme.primary,
            icon: Icon(Icons.more_vert, size: 40.0),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
