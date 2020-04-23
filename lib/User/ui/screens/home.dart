import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temis/User/model/game.dart';
import 'package:temis/User/model/user.dart';
import 'package:temis/User/repository/auth.dart';
import 'package:temis/User/repository/database_firestore.dart';
import 'package:temis/User/ui/widgets/home/name_user.dart';
import 'package:temis/User/ui/widgets/home/settings_profile.dart';
import 'package:temis/User/ui/widgets/list_case_active.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return MultiProvider(
      providers: [
        // Data from User
        StreamProvider<User>.value(
            value: DatabaseService(uid: user.uid).userData),
        // Games from User
        StreamProvider<List<Game>>.value(value: DatabaseService().gamesUser),
      ],
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0), // here the desired height
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).colorScheme.onSecondary,
              flexibleSpace: Center(
                widthFactor: 0.1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "TEMIS",
                        style: Theme.of(context).textTheme.title.copyWith(
                            fontSize: 22,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      IconButton(
                        padding: EdgeInsets.all(0.0),
                        color: Theme.of(context).colorScheme.primary,
                        icon: Icon(Icons.more_vert, size: 40.0),
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.black12,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                                child: SettingsProfile(),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
              ),
              elevation: 0,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Container(
            padding: EdgeInsets.all(45.0),
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
                        SizedBox(height: 15),
                        Text(
                          "Continuar",
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        ListCaseActive(),
                        Text(
                          "Comenzar nueva aventura",
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        // Spacer(),
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
