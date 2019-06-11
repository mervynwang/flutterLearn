/**
 *  TAB
 */

import 'package:flutter/material.dart';
import './navbar.dart';

class Analytic extends StatelessWidget {
  const Analytic({Key key}) : super(key: key);

  Widget buildBody() {
    return Container(
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text("Analytic"),
              Text("Analytic"),
              Text("Analytic"),
              Image.asset("a.png")
            ],
          ),
        ],
      ),
    );
  }

  Widget buildBody2() {
    return Container(
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text("Analytic2"),
              Text("Analytic2"),
              Text("Analytic2"),
              Image.asset("a.png")
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
          drawer: NavBar(),
          appBar: AppBar(
            title: Text("Categorys"),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  // text: 'Chart1',
                  icon: Icon(Icons.create),
                ),
                Tab(icon: Icon(Icons.create_new_folder),),
                Tab(text: 'Chart3'),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              buildBody(),
              buildBody2(),
              buildBody(),
            ],
          )),
    );
  }
}
