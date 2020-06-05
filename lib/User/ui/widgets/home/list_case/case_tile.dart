import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:temis/User/model/case.dart';
import 'package:temis/User/ui/widgets/home/list_case/select_role.dart';

class CaseView extends StatefulWidget {
  @override
  _CaseViewState createState() => _CaseViewState();
}

class _CaseViewState extends State<CaseView> {
  PageController pageController;
  double viewportFraction = 0.80;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: 0, viewportFraction: viewportFraction)
          ..addListener(() {
            setState(() {
              pageOffset = pageController.page;
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    var cases = Provider.of<List<CaseModel>>(context) ?? [];

    return PageView.builder(
      controller: pageController,
      itemCount: cases.length,
      itemBuilder: (context, index) {
        double scale = max(viewportFraction,
            (1 - (pageOffset - index).abs()) + viewportFraction);
        var left = 20.0;
        if (index == 0) {
          left = 0;
        }
        return Container(
          padding: EdgeInsets.only(
            right: 0,
            left: left,
            top: 55 - scale * 25,
            bottom: 15,
          ),
          child: Stack(
            overflow: Overflow.visible,
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  color: Theme.of(context).colorScheme.primary,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 8.0,
                      spreadRadius: 0.1,
                      offset: Offset(
                        0.0,
                        1.0,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxHeight > 200) {
                      return Container(
                        height: 180,
                        child: Image.asset('assets/${cases[index].img}.png'),
                      );
                    } else {
                      return Container(
                        width: 0,
                      );
                    }
                  },
                ),
              ),
              Positioned(
                bottom: -12,
                child: Container(
                  height: 34,
                  width: 176,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: RaisedButton(
                    onPressed: () {
                      // Select Roles
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
                            child: SelectRole(caseGame: cases[index]),
                          );
                        },
                      );
                    },
                    color: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      "Comenzar aventura",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${cases[index].name}",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "\nScore: ${cases[index].pointsMax}",
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                fontSize: 16,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
