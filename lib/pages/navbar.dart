import 'package:flutter/material.dart';

import './home.dart';
import './setting.dart';
import './categorys.dart';
import './analytic.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key key}) : super(key: key);

  Future Nav(BuildContext context, String pageStr) {
    return Navigator.pushReplacementNamed(context, pageStr);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Choose"),
          ),
          ListTile(title: Text("Home"), onTap: () => Nav(context, "Home")),
          ListTile(
              title: Text("Setting"), onTap: () => Nav(context, "Setting")),
          ListTile(title: Text("Budget"), onTap: () => Nav(context, "Budget")),
          ListTile(
              title: Text("Categorys"), onTap: () => Nav(context, "Categorys")),
          ListTile(
              title: Text("Analytic"), onTap: () => Nav(context, "Analytic")),
          ListTile(
              title: Text("Logout"),
              onTap: () {
                print("logout");
                Nav(context, "Auth");
              }),
        ],
      ),
    );
  }
}
