import 'package:flutter/material.dart';

import './navbar.dart';

class Categorys extends StatelessWidget {
  const Categorys({Key key}) : super(key: key);

  Widget buildBody() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("Categorys"),
                  Text("Categorys2"),
                  Text("Categorys3"),
                ],
              ),
              Column(
                children: <Widget>[
                  Text("Categorys"),
                  Text("Categorys2"),
                  Text("Categorys3"),
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
        title: Text("Categorys"),
      ),
      body: buildBody(),
    );
  }
}
