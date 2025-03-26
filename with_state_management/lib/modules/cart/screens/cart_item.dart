
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:with_state_management/modules/cart/stores/cart_store.dart';

class CartItem extends StatelessWidget {
  final int index;
  const CartItem(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Item ${index + 1}'),
      trailing: IconButton(
        icon: const Icon(Icons.remove_shopping_cart),
        onPressed: context.read<CartStore>().removeFromCart,
      ),
    );
  }
}