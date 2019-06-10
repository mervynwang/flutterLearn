import 'package:flutter/material.dart';

import './pages/account.dart';

class Products extends StatelessWidget {
  final List<String> _products;
  final Function delProduct;

  Products(this._products, {this.delProduct}) {
    print('[Products Build]');
  }

  Widget _buildList(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Text(_products[index]),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                  child: Text("Detail"),
                  onPressed: () => Navigator.push<bool>(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Account(_products[index])),
                      ).then((bool val) {
                        if (val) {
                          delProduct(index);
                        }
                      })
                    )
            ],
          )
          // Image.asset('assets/a.png'),
        ],
      ),
    );
  }

  Widget _buildListOrNot() {
    return _products.length > 0
        ? ListView.builder(
            itemBuilder: _buildList,
            itemCount: _products.length,
          )
        : Center(
            // child: Text("No Data"),
            );
  }

  @override
  Widget build(BuildContext context) {
    // print('[Products Widget Build]');

    return _buildListOrNot();
  }
}
