
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_provider/core/providers/cart_provider.dart';
import '../../../core/helpers/image_helper.dart';
import '../models/product_model.dart';

class CartItem extends StatelessWidget {
  final ProductModel productModel;
  const CartItem(this.productModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ImageHelper.buildImageWidget(productModel.image, width: 70, height: 70),
      title: Text('${productModel.title}'),
      trailing: IconButton(
        icon: const Icon(Icons.remove_shopping_cart),
        onPressed: () => context.read<CartProvider>().removeFromCart(productModel)
      ),
    );
  }
}