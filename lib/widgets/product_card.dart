import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'price_tag.dart';
import 'title_default.dart';
import 'address_tag.dart';
import '../scopedModel/main.dart';
import '../Models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int productIndex;

  ProductCard({this.product, this.productIndex});

  Widget _buildTitleAndPriceRow() {
    return Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TitleDefault(
              title: product.title,
            ),
            SizedBox(
              width: 8.0,
            ),
            PriceTag(
              price: product.price.toString(),
            )
          ],
        ));
  }

  Widget _buildActionButton(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.info),
            color: Theme.of(context).accentColor,
            onPressed: () => Navigator.pushNamed<bool>(
                context, '/product/' + productIndex.toString())),
        ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
            return IconButton(
              icon: Icon(model.products[productIndex].isFavourite
                  ? Icons.favorite
                  : Icons.favorite_border),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                model.setSelectProduct(productIndex);
                model.setProductFavourite();
              },
            );
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product.image),
          _buildTitleAndPriceRow(),
          AddressTag(),
          Text(product.userEmail),
          _buildActionButton(context),
        ],
      ),
    );
  }
}
