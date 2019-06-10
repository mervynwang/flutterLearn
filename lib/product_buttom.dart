import 'dart:typed_data';

import 'package:flutter/material.dart';
import './products.dart';
import './product_control.dart';

class ProductsButtom extends StatefulWidget {
  final String sproducts;

  ProductsButtom({this.sproducts}) {
    print('[ProductsButtom Build]');
  }

  @override
  State<StatefulWidget> createState() {
    print('[ProductsButtom State]');
    // TODO: implement createState
    return _ProductsButtomState();
  }
}

class _ProductsButtomState extends State<ProductsButtom> {
  List<String> _products = [];
  int counter = 0;

  @override
  void initState() {
    super.initState();
    print('[ProductsButtom initState]');
    if (widget.sproducts != null) {
      _products.add(widget.sproducts);
    }
  }

  @override
  void didUpdateWidget(ProductsButtom oldWidget) {
    print('[ProductsButtom didUpdateWidget]');
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(String product) {
    setState(() {
      counter++;
      _products.add(product + counter.toString());
    });
  }

  void _delProduct(int index) {
    setState(() {
      
      _products.removeAt(index);
    });    
  }

  @override
  Widget build(BuildContext context) {
    print('[ProductsButtom Widget]');

    return Column(children: <Widget>[
      Container(margin: EdgeInsets.all(5), child: ProductControl(_addProduct)),
      Expanded(child: Products(_products, delProduct: _delProduct))
    ]);
  }
}
