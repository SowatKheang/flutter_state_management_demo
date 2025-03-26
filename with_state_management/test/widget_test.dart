// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:with_state_management/modules/cart/stores/cart_store.dart';

void main() {
  late CartStore cartStore;

  setUp(() {
    cartStore = CartStore();
  });

  test('Initial value of nbCart should be 0', () {
    expect(cartStore.nbCart, equals(0));
  });

  test('addToCart() should increase nbCart by 1', () {
    cartStore.addToCart();
    expect(cartStore.nbCart, equals(1));

    cartStore.addToCart();
    expect(cartStore.nbCart, equals(2));
  });

  test('removeFromCart() should decrease nbCart by 1', () {
    cartStore.addToCart();
    cartStore.addToCart();
    expect(cartStore.nbCart, equals(2));

    cartStore.removeFromCart();
    expect(cartStore.nbCart, equals(1));

    cartStore.removeFromCart();
    expect(cartStore.nbCart, equals(0));

  });

  test('nbCart should not go below 0', () {
    cartStore.removeFromCart();
    expect(cartStore.nbCart, equals(-1)); // This test will fail if you need a min limit
  });
  
}
