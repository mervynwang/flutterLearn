import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

import 'package:http/http.dart' as http;
import './home.dart';

class AuthPage extends StatefulWidget {
  // AuthPage({Key key}) : super(key: key);

  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String tempStr = '';

  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics;
  List<BiometricType> _availableBiometrics;
  String _authorized = 'Not Authorized';

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
      print(availableBiometrics);
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true);
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _authorized = authenticated ? 'Authorized' : 'Not Authorized';
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(Platform.environment);

    // print(Platform.isIOS);
    // print(Platform.isAndroid);

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
          //--------------------------------------------------------
          //--------------------------------------------------------
          Text('Can check biometrics: $_canCheckBiometrics\n'),
          RaisedButton(
            child: const Text('Check biometrics'),
            onPressed: _checkBiometrics,
          ),
          Text('Available biometrics: $_availableBiometrics\n'),
          RaisedButton(
            child: const Text('Get available biometrics'),
            onPressed: _getAvailableBiometrics,
          ),
          Text('Current State: $_authorized\n'),
          RaisedButton(
            child: const Text('Authenticate'),
            onPressed: _authenticate,
          ),
          //--------------------------------------------------------
          //--------------------------------------------------------
          RaisedButton(
              child: Text("Save"),
              onPressed: () {
                // DoAuth();
              }),
          RaisedButton(
              child: Text("Login"),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomePage()));
              }),
          // RaisedButton(
          //     child: Text("showModalBottomSheet Note"),
          //     onPressed: () {
          //       showModalBottomSheet(
          //           context: context,
          //           builder: (BuildContext context) {
          //             return Center(
          //               child: Text("note"),
          //             );
          //           });
          //     }),
        ],
      ),
    );
  }
}
