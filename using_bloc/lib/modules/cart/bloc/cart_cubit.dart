
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:using_bloc/core/helper/image_helper.dart';
import 'package:using_bloc/modules/cart/bloc/cart_state.dart';
import '../../product/model/product_model.dart';

class CartCubit extends Cubit<CartState> {

  CartCubit() : super(const CartState.init([]));
  
  void add(BuildContext context, ProductModel product) {
    if (state.carts.contains(product)) {
      showDialog(context: context, builder: (context) => AboutDialog(
        applicationIcon: ImageHelper.buildImageWidget(product.image, width: 50, height: 50),
        applicationName: product.title,
        applicationVersion: product.price.toString(),
        children: const [
          Text('This item is already in the cart.')
        ],
      ));
      return;
    }

    List<ProductModel> updatedCarts = List.from(state.carts); 
    updatedCarts.add(product);

    emit(CartState.add(product, updatedCarts));
  }

  void remove(ProductModel product) {
    List<ProductModel> updatedCarts = List.from(state.carts);
    updatedCarts.remove(product); 
    emit(CartState.remove(product, updatedCarts));
  }

  bool get isEmpty => state.isEmtpy;

  int get nbCart => state.carts.length;

}