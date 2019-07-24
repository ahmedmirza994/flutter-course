import 'package:scoped_model/scoped_model.dart';

import '../Models/user.dart';
import './connected_products.dart';

class UserModel extends ConnectedProducts{
  

  void login(String email, String password) {
    authenticatedUser = User(id: 'sdad', email: email, password: password);
  }
}