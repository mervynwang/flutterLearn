import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  final String title;


  _showWarn(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Are You sure"),
          content: Text(" DELETE ME"),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancel"),
              onPressed: () {
                print("Cancel");
                Navigator.pop(context);
              },
            ),
            FlatButton(
                child: Text("YES"),
                onPressed: () {
                  print("YES");
                  // close showDialog
                  Navigator.pop(context);
                  // close Page & Del
                  Navigator.pop(context, true);
                })
          ],
        );
      },
    );
  }

  Account(this.title);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          print('WillPopScope');
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text(this.title),
            ),
            body: Column(
              children: <Widget>[
                Text("Account detail"),
                Text("Account detail1"),
                Text("Account detail2"),
                Text("Account detail3"),
                Text("Account detail4"),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text('Delete'),
                  onPressed: () => _showWarn(context),
                )
              ],
            )));
  }
}
