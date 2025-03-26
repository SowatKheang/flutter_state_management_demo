
import 'package:flutter/material.dart';

import '../../modules/products/models/product_model.dart';

class CartProvider extends ChangeNotifier {

  final List<ProductModel> _carts = [];

  List<ProductModel> get carts => _carts;

  void addToCart(ProductModel product) {
    _carts.add(product);
    notifyListeners();
  }

  void removeFromCart(ProductModel product) {
    _carts.remove(product);
    notifyListeners();
  }
  

}