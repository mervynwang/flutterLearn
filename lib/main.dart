import 'package:flutter/material.dart';
import 'package:testpro/pages/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './pages/auth.dart';
import './pages/home.dart';
import './pages/setting.dart';
import './pages/categorys.dart';
import './pages/analytic.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintPointersEnabled = true;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  SharedPreferences prefs;
  
  MyApp()  {
    _initShare();
  }

  _initShare() async {
    this.prefs = await SharedPreferences.getInstance();
  }

  _incrementCounter() async {
    this.prefs = await SharedPreferences.getInstance();
    int counter = this.prefs.getInt('counter') ?? 5;
    print('Pressed $counter times.');
    await this.prefs.setInt('counter', counter);
  }

  @override
  Widget build(BuildContext context) {
    _incrementCounter();

    return MaterialApp(
      // debugShowMaterialGrid: true,
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.green,
        // brightness: Brightness.dark,
      ),
      home: AuthPage(),
      routes: {
        'Home': (BuildContext context) => HomePage(),
        'Setting': (BuildContext context) => Setting(),
        'Auth': (BuildContext context) => AuthPage(),
        // 'Account' : (BuildContext context) => Account(""),
        'Budget': (BuildContext context) => Setting(),
        'Categorys': (BuildContext context) => Categorys(),
        'Analytic': (BuildContext context) => Analytic(),
      },
      onGenerateRoute: (RouteSettings setting) {
        print(setting);
        print(setting.name);
      },
      onUnknownRoute: (RouteSettings setting) {
        print(setting);
        return MaterialPageRoute(builder: (BuildContext context) => HomePage() );
      },
    );
  }
}


