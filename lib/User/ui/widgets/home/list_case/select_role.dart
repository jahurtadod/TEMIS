import 'package:flutter/material.dart';
import 'package:temis/User/model/case.dart';
import 'package:temis/User/model/game.dart';
import 'package:temis/User/model/role.dart';
import 'package:temis/User/ui/widgets/home/list_case/role_widget.dart';

class SelectRole extends StatefulWidget {
  final CaseModel caseGame;

  SelectRole({@required this.caseGame});

  @override
  _SelectRoleState createState() => _SelectRoleState();
}

class _SelectRoleState extends State<SelectRole> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff292A2D),
      padding: EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 35.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Selecciona el rol a jugar",
            style: Theme.of(context).textTheme.headline5.copyWith(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
          Row(
            children: <Widget>[
              RoleWidget(
                icon: "juez",
                text: "Juez",
                game: Game(
                  caseGame: widget.caseGame,
                  role: Role().juez,
                ),
              ),
              Spacer(),
              RoleWidget(
                icon: "fiscalia",
                text: "Fiscalía",
                game: Game(
                  caseGame: widget.caseGame,
                  role: Role().fiscalia,
                ),
              ),
              Spacer(),
              RoleWidget(
                icon: "defensa",
                text: "Defensa",
                game: Game(
                  caseGame: widget.caseGame,
                  role: Role().defensa,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
