
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_provider/core/providers/cart_provider.dart';
import 'cart_item.dart';

///
/// CartScreen: Display the cart items
///
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    debugPrint('<<<=== CartScreen REBUILD');

    return Consumer<CartProvider>(
      builder: (context, cartProvider, _) {
        if (cartProvider.carts.isEmpty) {
          return const Center(child: Text('No items in the cart.'));
        }
        return ListView.builder(
          itemCount: cartProvider.carts.length,
          itemBuilder: (context, index) => CartItem(cartProvider.carts[index])
        );
      },
    );
  }
}
