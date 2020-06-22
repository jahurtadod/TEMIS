import 'package:flutter/material.dart';
import 'package:temis/User/ui/widgets/home/list_case/case_tile.dart';

class CaseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Selecciona nueva audiencia",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(
            child: CaseView(), // Case
          ),
        ],
      ),
    );
  }
}
