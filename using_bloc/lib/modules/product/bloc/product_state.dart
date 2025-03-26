
import 'package:equatable/equatable.dart';
import 'package:using_bloc/modules/product/model/product_model.dart';
import '../../../core/enum/app_enum.dart';

///
/// [ProductState] is a class that is used to manage the state of the product.
///
///
class ProductState extends Equatable {

  final LoadingState loadingState;
  final List<ProductModel> products;

  const ProductState._({
    this.loadingState = LoadingState.loading,
    this.products = const <ProductModel>[],
  });

  const ProductState.loading() : this._();

  const ProductState.success(List<ProductModel> items): this._(loadingState: LoadingState.success, products: items);

  const ProductState.error() : this._(loadingState: LoadingState.error);

  @override
  List<Object> get props => [loadingState, products];

}

// abstract class ProductState extends Equatable {
//   const ProductState();
  
//   @override
//   List<Object?> get props => [];
// }

// class ProductLoading extends ProductState {
//   const ProductLoading();
// }

// class ProductSuccess extends ProductState {

//   final List<ProductModel> products;
//   const ProductSuccess(this.products);

//   @override
//   List<Object?> get props => [products];
// }

// class ProductError extends ProductState {
//   const ProductError();
// }