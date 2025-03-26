
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartStore = CartStoreBase with _$CartStore;

abstract class CartStoreBase with Store {
  
  @observable
  int _nbCart = 0;

  @action
  void addToCart() {
    _nbCart++;
    debugPrint('ADD_TO_CART_CALLED: nbCart: $_nbCart');
  }

  @action
  void removeFromCart() {
    _nbCart--;
    debugPrint('REMOVE_FROM_CART_CALLED: nbCart: $_nbCart');
  }

  @computed
  bool get isCartEmpty => _nbCart == 0;

  @computed
  int get nbCart => _nbCart;
}