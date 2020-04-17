import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temis/User/model/game.dart';
import 'package:temis/User/repository/auth.dart';
import 'package:temis/User/repository/database_firestore.dart';
import 'package:temis/User/ui/widgets/info_user.dart';
import 'package:temis/User/ui/widgets/list_case_active.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingdPanel() {
      showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 60.0,
            ),
            child: Text("Bottom Sheet"),
          );
        },
      );
    }

    return MultiProvider(
      providers: [
        StreamProvider<DocumentSnapshot>.value(value: DatabaseService().user),
        StreamProvider<List<Game>>.value(value: DatabaseService().gamesUser),
      ],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                        height: 40.0,
                        width: 40.0,
                        child: IconButton(
                          padding: EdgeInsets.all(0.0),
                          color: Colors.white,
                          icon: Icon(Icons.more_vert, size: 40.0),
                          onPressed: () => _showSettingdPanel(),
                        )),
                    // IconButton(
                    //   iconSize: 40,
                    //   padding: EdgeInsets.all(0),
                    //   icon: Icon(Icons.more_vert),
                    //   color: Colors.white,
                    //   alignment: Alignment.topRight,
                    //   onPressed: () {},
                    // ),
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //InfoUser(),
                        Spacer(),
                        Text(
                          "TEMIS Ascendere",
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Casos Activos",
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        ListCaseActive(),
                        // Spacer(),
                        RaisedButton(
                          onPressed: () async {
                            await _auth.signOut();
                          },
                          child: Text("Cerrar Sesion"),
                          //color: Color(0xff7ec7d0),
                          shape: RoundedRectangleBorder(),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
