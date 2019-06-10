import 'package:flutter/material.dart';
import '../product_buttom.dart';

import './navbar.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text('Easy'),
        ),
        body: ProductsButtom());
  }
}
