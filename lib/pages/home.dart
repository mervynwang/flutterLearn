import 'package:flutter/material.dart';
import '../product_buttom.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Easy'),
        ),
        body: ProductsButtom());
  }
}
