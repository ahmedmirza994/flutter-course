import 'package:flutter/material.dart';
import 'product_card.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scopedModel/main.dart';
import '../Models/product.dart';

class Products extends StatelessWidget {
  
  Widget _buildProductList(List<Product> products) {
    Widget productCards;
    if (products.length > 0) {
      productCards = ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) => ProductCard(
                product: products[index],
                productIndex: index,
              ));
    } else {
      productCards = Center(
        child: Text('No Product Found, add some Products'),
      );
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return _buildProductList(model.displayedProducts);
      },
    );
  }
}
