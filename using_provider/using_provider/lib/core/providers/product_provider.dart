
import 'package:flutter/material.dart';
import 'package:using_provider/core/enums/app_enum.dart';
import 'package:using_provider/modules/products/models/product_model.dart';
import '../../modules/products/services/product_service.dart';

///
/// [ProductProvider] is a class that extends [ChangeNotifier] to provide a list of products.
///
class ProductProvider extends ChangeNotifier {

  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  LoadingState _state = LoadingState.loading;

  LoadingState get state => _state;
  
  Future<void> getList({Map<String, dynamic>? queryParams, bool loadMore = false}) async {
    Map<String, dynamic> params = queryParams ?? {};
    
    if (loadMore) {
      params['offset'] = _products.isEmpty ? 0 : _products.length;
    } else {
      _state = LoadingState.loading;
      notifyListeners();
    }

    try {
      List<ProductModel> list = await ProductService.getInstance().list(queryParams: params);

      if (loadMore) {
        _products.addAll(list);
      } else {
        _products = list;
      }
      _state = LoadingState.success;
      notifyListeners();

    } on Exception {
      _state = LoadingState.error;
      notifyListeners();
    }
  }

}