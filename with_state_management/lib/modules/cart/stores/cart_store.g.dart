// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartStore on CartStoreBase, Store {
  Computed<bool>? _$isCartEmptyComputed;

  @override
  bool get isCartEmpty =>
      (_$isCartEmptyComputed ??= Computed<bool>(() => super.isCartEmpty,
              name: 'CartStoreBase.isCartEmpty'))
          .value;
  Computed<int>? _$nbCartComputed;

  @override
  int get nbCart => (_$nbCartComputed ??=
          Computed<int>(() => super.nbCart, name: 'CartStoreBase.nbCart'))
      .value;

  late final _$_nbCartAtom =
      Atom(name: 'CartStoreBase._nbCart', context: context);

  @override
  int get _nbCart {
    _$_nbCartAtom.reportRead();
    return super._nbCart;
  }

  @override
  set _nbCart(int value) {
    _$_nbCartAtom.reportWrite(value, super._nbCart, () {
      super._nbCart = value;
    });
  }

  late final _$CartStoreBaseActionController =
      ActionController(name: 'CartStoreBase', context: context);

  @override
  void addToCart() {
    final _$actionInfo = _$CartStoreBaseActionController.startAction(
        name: 'CartStoreBase.addToCart');
    try {
      return super.addToCart();
    } finally {
      _$CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromCart() {
    final _$actionInfo = _$CartStoreBaseActionController.startAction(
        name: 'CartStoreBase.removeFromCart');
    try {
      return super.removeFromCart();
    } finally {
      _$CartStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isCartEmpty: ${isCartEmpty},
nbCart: ${nbCart}
    ''';
  }
}
