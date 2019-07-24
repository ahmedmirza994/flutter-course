import 'package:scoped_model/scoped_model.dart';
import '../Models/product.dart';
import './connected_products.dart';

class ProductsModel extends ConnectedProducts {
  
  
  bool _showFavourites = false;

  List<Product> get getAllProducts {
    return List.from(products);
  }

  List<Product> get displayedProducts {
    if (_showFavourites) {
      return List.from(products.where((Product product) => product.isFavourite).toList());
    }
    return List.from(products);
  }

  int get getSelectedProductIndex {
    return selectedProductIndex;
  }

  bool get displayFavouritesOnly {
    return _showFavourites;
  }

  Product get getSelectedProduct {
    if (selectedProductIndex == null) {
      return null;
    }
    return products[getSelectedProductIndex];
  }

  void deleteProduct() {
    products.removeAt(selectedProductIndex);
    selectedProductIndex = null;
    notifyListeners();
  }

  void updateProduct(Product product) {
    products[selectedProductIndex] = product;
    selectedProductIndex = null;
    notifyListeners();
  }

  void setSelectProduct(int index) {
    selectedProductIndex = index;
    notifyListeners();
  }

  void setProductFavourite() {
    final bool currentStatus = getSelectedProduct.isFavourite;
    final bool newCurrentStatus = !currentStatus;
    final Product updatedProduct = Product(
        title: getSelectedProduct.title,
        description: getSelectedProduct.description,
        price: getSelectedProduct.price,
        image: getSelectedProduct.image,
        isFavourite: newCurrentStatus);
    products[selectedProductIndex] = updatedProduct;
    selectedProductIndex = null;
    notifyListeners();
  }

  void toggleDisplayMode() {
    _showFavourites = !_showFavourites;
    notifyListeners();
    selectedProductIndex = null;
  }
}
