
import 'package:bloc/bloc.dart';
import 'package:using_bloc/modules/product/service/product_service.dart';
import 'product_state.dart';

///
/// [ProductCubit]
///
class ProductCubit extends Cubit<ProductState> {

  ProductCubit() : super(const ProductState.loading());

  ///
  /// Get the list of products
  ///
  Future<void> getList({Map<String, dynamic>? queryParams, bool loadMore = false}) async {
    Map<String, dynamic> params = queryParams ?? {};
    
    if (loadMore) {
      params['offset'] = state.products.isEmpty ? 0 : state.products.length;
    } else {
      emit(const ProductState.loading());
    }

    try {
      final products = await ProductService.getInstance().list(queryParams: params);
      final updatedList = loadMore ? [...state.products, ...products] : products;

      emit(ProductState.success(updatedList));
    } on Exception {
      emit(const ProductState.error());
    }
  }

}