import 'package:scoped_model/scoped_model.dart';

import '../Models/product.dart';
import '../Models/user.dart';

class ConnectedProducts extends Model {
  List<Product> products = [];
  User authenticatedUser;
  int selectedProductIndex;

  void addProduct(String title, String description, String image, double price) {
    final Product product = Product(title: title, description: description, image: image, price: price, userEmail: authenticatedUser.email, userId: authenticatedUser.id);
    products.add(product);
    selectedProductIndex = null;
    notifyListeners();
  }

}