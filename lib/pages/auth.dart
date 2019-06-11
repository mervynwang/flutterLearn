import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import './home.dart';

class AuthPage extends StatefulWidget {
  // AuthPage({Key key}) : super(key: key);

  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String tempStr = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: "Account"),
            onChanged: (String value) {
              setState(() {
                tempStr = value;
              });
            },
          ),
          Text(tempStr),
          TextField(
            decoration: InputDecoration(labelText: "Password"),
            keyboardType: TextInputType.text,
          ),          
          TextField(
            decoration: InputDecoration(labelText: "NumberOnly"),
            keyboardType: TextInputType.number,
            inputFormatters: [WhitelistingTextInputFormatter(RegExp(r"\d+"))],
          ),
          RaisedButton(
              child: Text("Save"),
              onPressed: () {

              }),          
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
                    });
              }),
        ],
      ),
    );
  }
}
