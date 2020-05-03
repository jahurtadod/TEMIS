import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24),
      color: Theme.of(context).colorScheme.onBackground,
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFE5F4F9),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(0),
              ),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 8, 12, 8),
              child: SpinKitThreeBounce(
                color: Theme.of(context).colorScheme.primary,
                size: 20.0,
              ),
            ),
          ),
          // SpinKitThreeBounce(
          //   color: Theme.of(context).colorScheme.primary,
          //   size: 24.0,
          // ),
        ],
      ),
    );
  }
}
