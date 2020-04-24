import 'package:flutter/material.dart';

class Case extends StatelessWidget {
  const Case({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Comenzar nueva aventura",
            style: Theme.of(context).textTheme.subtitle,
          ),
          SizedBox(
            height: 15,
          ),
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(24),
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Audiencia Sr. Parra",
                      style: Theme.of(context).textTheme.title.copyWith(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Score: 120",
                          style: Theme.of(context).textTheme.subtitle.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                        ),
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  color: Theme.of(context).colorScheme.primary,
                  // image: DecorationImage(
                  //   image: AssetImage(
                  //     'assets/imageCase1.png',
                  //   ),
                  //   alignment: Alignment(0.5, 0.0),
                  // ),
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
              Positioned(
                bottom: 32,
                right: 24,
                child: Container(
                  //width: 100,
                  height: 176,
                  child: Image.asset('assets/imageCase2.png'),
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
                    onPressed: () {},
                    color: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      "Comenzar aventura",
                      style: Theme.of(context).textTheme.subtitle.copyWith(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                    ),
                    //color: Color(0xff7ec7d0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
            ],
            overflow: Overflow.visible,
          ),
        ],
      ),
    );
  }
}
