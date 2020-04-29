import 'package:flutter/material.dart';

class WriteMessage extends StatelessWidget {
  const WriteMessage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 5, 15, 15),
      padding: EdgeInsets.fromLTRB(25, 2, 5, 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Theme.of(context).colorScheme.primary,
      ),
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Escribe un mensaje",
            style: Theme.of(context).textTheme.title.copyWith(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
          Container(
            width: 40.0,
            height: 40.0,
            child: Container(
              padding: EdgeInsets.all(5),
              child: Image.asset('assets/send.png'),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
