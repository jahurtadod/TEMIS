import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temis/User/model/game.dart';
import 'package:temis/User/ui/widgets/game_tile.dart';

class ListCaseActive extends StatefulWidget {
  @override
  _ListCaseActiveState createState() => _ListCaseActiveState();
}

class _ListCaseActiveState extends State<ListCaseActive> {
  @override
  Widget build(BuildContext context) {
    var games = Provider.of<List<Game>>(context);
    // games.forEach((game) {
    //   print("Mensaje");
    //   print(game.lastMessage);
    // });
    return ListView.separated(
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
    );
  }
}
