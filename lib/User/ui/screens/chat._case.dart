import 'package:flutter/material.dart';

class ChatCase extends StatefulWidget {
  @override
  _ChatCaseState createState() => _ChatCaseState();
}

class _ChatCaseState extends State<ChatCase> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Text(
                "Audiencia",
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(),
              Text(
                "Description",
                style: Theme.of(context).textTheme.subtitle,
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
