import 'package:flutter/material.dart';
import 'package:temis/User/model/case.dart';

class SelectOption extends StatelessWidget {
  final List<Sequence> options;

  const SelectOption({Key key, this.options}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff292A2D),
      padding: EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 0.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Container(
          //   padding: EdgeInsets.fromLTRB(45, 0, 45, 10),
          //   child: Text(
          //     "Tu eleccción . . .",
          //     style: Theme.of(context).textTheme.title.copyWith(
          //           fontSize: 16,
          //           color: Theme.of(context).colorScheme.onSecondary,
          //         ),
          //   ),
          // ),
          Flexible(
            child: ConstrainedBox(
              constraints: new BoxConstraints(
                minHeight: MediaQuery.of(context).size.height / 5,
                maxHeight: MediaQuery.of(context).size.height /
                    1, //this height is not contain `Text("Just a title")`'s height.
              ),
              child: ListView.builder(
                itemCount: 25,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text('Item ${index}'));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
