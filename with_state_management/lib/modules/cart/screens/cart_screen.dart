import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../stores/cart_store.dart';
import 'cart_item.dart';

///
/// CartScreen: Display the cart items
///
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (context.read<CartStore>().isCartEmpty) {
          return const Center(child: Text('No items in the cart.'));
        }
        return ListView.builder(
          itemCount: context.read<CartStore>().nbCart,
          itemBuilder: (context, index) => CartItem(index),
        );
      },
    );
  }
}
