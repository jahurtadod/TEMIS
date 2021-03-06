import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:temis/User/model/case.dart';
import 'package:temis/User/ui/widgets/chat/option_tile.dart';

class WriteMessage extends StatefulWidget {
  final List<Sequence> options;
  final Function(String _idTempEvent, String newText, int points)
      onSelectOption;

  const WriteMessage({this.options, this.onSelectOption});

  @override
  _WriteMessageState createState() => _WriteMessageState();
}

class _WriteMessageState extends State<WriteMessage> {
  PanelController _pc = PanelController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            // Open Animation
            _pc.open();
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 5, 15, 15),
            padding: EdgeInsets.fromLTRB(25, 2, 5, 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              color: Theme.of(context).colorScheme.primary,
            ),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Tu elección . . .",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                    ),
                    Container(
                      width: 38.0,
                      height: 45.0,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(7, 5, 5, 6),
                        child: Image.asset('assets/send.png'),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SlidingUpPanel(
          minHeight: 0,
          maxHeight: MediaQuery.of(context).size.height / 2,
          controller: _pc,
          panelBuilder: (ScrollController sc) {
            return ListView(
              controller: sc,
              children: <Widget>[
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  child: ListView.builder(
                    controller: ScrollController(),
                    itemCount: widget.options.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: OptionTile(
                          sequence: widget.options[index],
                          index: index,
                          onSelectOption: (newData, newText, points) {
                            setState(() {
                              // Returns the values of the option
                              widget.onSelectOption(newData, newText, points);
                              // Close Animation
                              _pc.close();
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
          body: Container(),
        ),
      ],
    );
  }
}
