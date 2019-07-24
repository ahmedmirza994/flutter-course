import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scopedModel/main.dart';

import 'product_edit.dart';

class ProductList extends StatelessWidget {

  Widget _buildEditButton(BuildContext context, int index, MainModel model) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        model.setSelectProduct(index);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return ProductEdit();
        }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              //direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
              ),
              key: Key(model.getAllProducts[index].title),
              onDismissed: (DismissDirection direction) {
                model.setSelectProduct(index);
                if (direction == DismissDirection.endToStart) {
                  model.deleteProduct();
                }
              },
              child: Column(
                children: <Widget>[
                  ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                          model.getAllProducts[index].image,
                        ),
                      ),
                      title: Text(model.getAllProducts[index].title),
                      subtitle:
                          Text('\$${model.getAllProducts[index].price.toString()}'),
                      trailing: _buildEditButton(context, index, model)),
                  Divider(
                    height: 1.0,
                  )
                ],
              ),
            );
          },
          itemCount: model.getAllProducts.length,
        );
      },
    );
  }
}
