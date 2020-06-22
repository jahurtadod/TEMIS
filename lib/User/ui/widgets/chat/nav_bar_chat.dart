import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      child: LayoutBuilder(builder: (context, constraints) {
        double size = 16;
        double sizeIcon = 40;
        // Responsive design
        if (constraints.maxWidth < 300) {
          size = 14;
          sizeIcon = 30;
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              padding: EdgeInsets.all(0.0),
              color: Theme.of(context).colorScheme.primary,
              icon: Icon(Icons.keyboard_arrow_left, size: sizeIcon),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.headline5.copyWith(
                      fontSize: size,
                      color: Color(0xff505050),
                    ),
                children: [
                  TextSpan(text: game.caseGame.name),
                  TextSpan(
                    text: "  Online ... ",
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontSize: 8,
                          color: Color(0xff03A50E),
                        ),
                  )
                ],
              ),
            ),
            Spacer(),
            ClipOval(
              child: Container(
                height: 40,
                width: 40,
                color: Colors.cyan,
                child: Center(
                  child: Image.asset(
                    'assets/${game.caseGame.route.role.toLowerCase()}.png',
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
