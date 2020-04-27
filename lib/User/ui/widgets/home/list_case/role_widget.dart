import 'package:flutter/material.dart';
import 'package:temis/User/model/game.dart';

class RoleWidget extends StatefulWidget {
  var text = "";
  var icon = "";
  Game game;

  RoleWidget({this.icon, this.text, this.game});

  @override
  _RoleWidgetState createState() => _RoleWidgetState();
}

class _RoleWidgetState extends State<RoleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40, bottom: 20),
      child: Row(
        children: <Widget>[
          Container(
            height: 100,
            width: 80,
            decoration: BoxDecoration(
              color: Color(0xffF9F9F9),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Column(
              children: <Widget>[
                Spacer(),
                IconButton(
                  padding: EdgeInsets.all(0.0),
                  color: Theme.of(context).colorScheme.primary,
                  icon: Icon(Icons.face, size: 40.0),
                  onPressed: () {
                    Navigator.of(context)
                        .popAndPushNamed('/startgame', arguments: widget.game);
                  },
                ),
                Spacer(),
                Text(
                  widget.text,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
