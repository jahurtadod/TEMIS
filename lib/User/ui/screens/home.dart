import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temis/User/model/case.dart';
import 'package:temis/User/repository/database_firestore.dart';
import 'package:temis/User/ui/widgets/home/footer.dart';
import 'package:temis/User/ui/widgets/home/list_case/list_case.dart';
import 'package:temis/User/ui/widgets/home/name_user.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Cases
        StreamProvider<List<CaseModel>>.value(value: DatabaseService().cases),
      ],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Container(
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
                        // ListCaseActive(), // Record
                        Expanded(
                          child: CaseList(), // Show each case
                          flex: 6,
                        ),
                        Footer(),
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
