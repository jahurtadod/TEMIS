import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key key,
  }) : super(key: key);

  _launchURL() async {
    const url = 'https://innovaciondocente.utpl.edu.ec';
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/page_info');
                  },
                  child: Text(
                    "TEMIS",
                    style: TextStyle(fontSize: 12.0, color: Color(0xff7ec7d0)),
                  )),
              FlatButton(
                  onPressed: _launchURL,
                  child: Text(
                    "Proyecto Ascendere",
                    style: TextStyle(fontSize: 12.0, color: Color(0xff7ec7d0)),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
