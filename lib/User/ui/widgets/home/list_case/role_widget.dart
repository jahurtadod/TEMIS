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
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .popAndPushNamed('/startgame', arguments: widget.game);
        },
        child: Container(
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
              Container(
                height: 50,
                child: Image.asset('assets/${widget.icon}.png'),
              ),
              Spacer(),
              Text(
                widget.text,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
