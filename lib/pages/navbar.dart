import 'package:flutter/material.dart';

import './home.dart';
import './setting.dart';
import './categorys.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key key}) : super(key: key);

  Future Nav(BuildContext context, String pageStr) {
    return Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) {
      switch (pageStr) {
        case "Home":
          return HomePage();
          break;        
        case "Setting":
          return Setting();
          break;
        case "Categorys":
          return Categorys();
          break;
        default:
          return Setting();
          break;
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Choose"),
          ),
          ListTile(
              title: Text("Home"), onTap: () => Nav(context, "Home")),
          ListTile(
              title: Text("Setting"), onTap: () => Nav(context, "Setting")),
          ListTile(
              title: Text("Account"), onTap: () => Nav(context, "Account")),
          ListTile(
              title: Text("Budget"), onTap: () => Nav(context, "Budget")),
          ListTile(
              title: Text("Categorys"), onTap: () => Nav(context, "Categorys")),
        ],
      ),
    );
  }
}
