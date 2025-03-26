
import 'package:equatable/equatable.dart';
import '../../product/model/product_model.dart';

///
/// [CartState]
///
class CartState extends Equatable {

  final List<ProductModel> carts;

  const CartState(this.carts);

  const CartState.init(List<ProductModel> carts): this(carts);

  const CartState.add(ProductModel product, List<ProductModel> carts): this(carts);

  const CartState.remove(ProductModel product, List<ProductModel> carts): this(carts);

  bool get isEmtpy => carts.isEmpty;

  @override
  List<Object> get props => [ carts ];
}