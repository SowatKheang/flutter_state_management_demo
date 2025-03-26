
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:using_bloc/modules/cart/screen/cart_item.dart';
import 'package:using_bloc/modules/product/model/product_model.dart';
import '../../../core/helper/log_helper.dart';
import '../bloc/cart_cubit.dart';
import '../bloc/cart_state.dart';

///
/// CartScreen: Display the cart items
///
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    LogHelper.getInstance().info('CartScreen build.');

    return BlocSelector<CartCubit, CartState, List<ProductModel>> (
      selector: (state) => state.carts,
      builder: (context, carts) {
        if (carts.isEmpty) {
          return const Center(
            child: Text('No items in the cart.')
          );
        }
        return ListView.builder(
          itemCount: carts.length,
          itemBuilder: (context, index) => CartItem(carts[index])
        );
      },
    );
  }
}
