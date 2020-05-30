import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(40, 24, 40, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "TEMIS",
                style: TextStyle(fontSize: 14.0, color: Color(0xff7ec7d0)),
              ),
              Text(
                "Proyecto Ascendere",
                style: TextStyle(fontSize: 14.0, color: Color(0xff7ec7d0)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
