import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temis/User/model/game.dart';
import 'package:temis/User/model/user.dart';
import 'package:temis/User/repository/database_firestore.dart';
import 'package:temis/User/ui/widgets/home/case.dart';
import 'package:temis/User/ui/widgets/home/cases_actives/list_case_active.dart';
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
                                SizedBox(height: 20),
                                Case(),
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

// Row(
//   mainAxisAlignment: MainAxisAlignment.end,
//   children: <Widget>[
//     // Settings Button
//     IconButton(
//       padding: EdgeInsets.all(0.0),
//       color: Colors.white,
//       icon: Icon(Icons.more_vert, size: 40.0),
//       onPressed: () {
//         showModalBottomSheet(
//           backgroundColor: Colors.black12,
//           isScrollControlled: true,
//           context: context,
//           builder: (context) {
//             return ClipRRect(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(10.0),
//                 topRight: Radius.circular(10.0),
//               ),
//               child: SettingsProfile(),
//             );
//           },
//         );
//         // showModalBottomSheet(
//         //   isScrollControlled: true,
//         //   context: context,
//         //   builder: (context) {
//         //     // return SettingsProfile();
//         //     return DraggableScrollableSheet(
//         //         initialChildSize: 0.1,
//         //         //maxChildSize: 1,
//         //         minChildSize: 0.25,
//         //         expand: false,
//         //         builder: (context,
//         //             ScrollController scrollController) {
//         //           return SettingsProfile();
//         //         });
//         //   },
//         // );
//       },
//     ),
//   ],
// ),
