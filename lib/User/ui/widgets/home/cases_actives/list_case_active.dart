import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temis/User/model/game.dart';
import 'package:temis/User/ui/widgets/home/cases_actives/game_tile.dart';

class ListCaseActive extends StatefulWidget {
  @override
  _ListCaseActiveState createState() => _ListCaseActiveState();
}

class _ListCaseActiveState extends State<ListCaseActive> {
  @override
  Widget build(BuildContext context) {
    var games = Provider.of<List<Game>>(context) ?? [];
    return Container(
      padding: EdgeInsets.only(left: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Continuar",
            style: Theme.of(context).textTheme.subtitle,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(24, 16, 40, 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(15),
              ),
              color: Color(0xffe97a98),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                // List Chats-Active
                ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: games.length,
                  itemBuilder: (context, index) {
                    return GameTile(game: games[index]);
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 0.0,
                      indent: 46,
                      color: Colors.white,
                    );
                  },
                ),
                // Button
                InkWell(
                  onTap: () {
                    // Other Page
                  },
                  child: Text(
                    "Ver más >",
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
