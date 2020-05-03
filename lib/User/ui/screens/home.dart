import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temis/User/model/case.dart';
import 'package:temis/User/model/game.dart';
import 'package:temis/User/model/user.dart';
import 'package:temis/User/repository/database_firestore.dart';
import 'package:temis/User/ui/widgets/home/games_actives/list_case_active.dart';
import 'package:temis/User/ui/widgets/home/list_case/list_case.dart';
import 'package:temis/User/ui/widgets/home/name_user.dart';
import 'package:temis/widgets/loading.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return MultiProvider(
      providers: [
        // Data from User
        // StreamProvider<User>.value(
        //     value: DatabaseService(uid: user.uid).userData),
        // Games from User
        StreamProvider<List<Game>>.value(value: DatabaseService().gamesUser),
        // Cases
        StreamProvider<List<CaseModel>>.value(value: DatabaseService().cases),
      ],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: StreamBuilder<User>(
              stream: DatabaseService(uid: user.uid).userData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: <Widget>[],
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Spacer(),
                                NameUser(),
                                ListCaseActive(),
                                Expanded(
                                  child: CaseList(),
                                  flex: 6,
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Loading();
                }
              }),
        ),
      ),
    );
  }
}
