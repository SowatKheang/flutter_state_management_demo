
import 'package:flutter/material.dart';
import 'package:using_bloc/core/service/base_service.dart';
import 'package:using_bloc/core/service/http_api.dart';
import 'package:using_bloc/core/service/http_service.dart';
import 'package:using_bloc/modules/product/model/product_model.dart';

///
/// [ProductService] is a class that extends [BaseService] and is used to fetch data from the server.
/// implement using the Singleton design pattern
///
class ProductService extends BaseService<ProductModel> {

  static ProductService? _service;
  ProductService._();
  
  static ProductService getInstance() {
    _service ??= ProductService._();
    return _service!;
  }

  @override
  Future<ProductModel> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }
  
  @override
  Future<List<ProductModel>> list({required Map<String, dynamic> queryParams, int offset = 0, int limit = 10}) async {
      Map<String, dynamic> params = queryParams; 
      params['offset'] = offset;
      params['limit'] = limit;

      List<ProductModel> products = [];
      try {
        return await HttpService.getInstance().get(HttpApi.product, params).then((response) {
          if (response.data != null && response.data is List && response.data.isNotEmpty) {
            products = List<ProductModel>.from(response.data.map((model) => ProductModel.fromJson(model)));
          }
          return products;
        });
      } catch (e) {
        debugPrint('GET_PRODUCT_LIST_ERROR: $e');
        return products;
      }
  }

}