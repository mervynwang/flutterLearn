import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  final String title;

  Account(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onPressed: () => Navigator.pop(context, true)
            )
          ],
        ));
  }
}
