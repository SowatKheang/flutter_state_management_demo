
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_provider/core/providers/cart_provider.dart';
import 'package:using_provider/core/providers/setting_provider.dart';

///
/// BottomNavBarWidget
///
class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {

  @override
  Widget build(BuildContext context) {
    debugPrint('<<<=== BottomNavBarWidget REBUILD');
    return BottomNavigationBar(
      currentIndex: context.watch<SettingProvider>().pageIndex,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Badge.count(
            count: context.watch<CartProvider>().carts.length,
            textStyle: const TextStyle(fontSize: 18),
            offset: const Offset(10, -10),
            largeSize: 22.0,
            smallSize: 18.0,
            child: const Icon(Icons.shopping_cart),
          ),
          label: 'View Cart',
        ),
      ],
      onTap: (index) {
        context.read<SettingProvider>().navigate(index);
      },
    );
  }
}