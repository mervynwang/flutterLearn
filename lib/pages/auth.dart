import 'package:flutter/material.dart';

import './home.dart';

class AuthPage extends StatefulWidget {
  // AuthPage({Key key}) : super(key: key);

  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Text("Account"),
          RaisedButton(
              child: Text("Login"),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomePage()));
              }),
          RaisedButton(
              child: Text("showModalBottomSheet Note"),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: Text("note"),
                    );
                  }
                );
              }),              
        ],
      )),
    );
  }
}
