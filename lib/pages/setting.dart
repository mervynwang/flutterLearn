import 'package:flutter/material.dart';

import './navbar.dart';

class Setting extends StatelessWidget {
  const Setting({Key key}) : super(key: key);

  Widget buildBody() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("Setting"),
                  Text("Setting2"),
                  Text("Setting3"),
                ],
              ),
              Column(
                children: <Widget>[
                  Text("Setting"),
                  Text("Setting2"),
                  Text("Setting3"),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: buildBody(),
    );
  }
}
