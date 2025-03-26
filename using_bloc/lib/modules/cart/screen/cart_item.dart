
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:using_bloc/modules/cart/bloc/cart_cubit.dart';
import 'package:using_bloc/modules/product/model/product_model.dart';
import '../../../core/helper/image_helper.dart';

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
        onPressed: () => context.read<CartCubit>().remove(productModel)
      ),
    );
  }
}