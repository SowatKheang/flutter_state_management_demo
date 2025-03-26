
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:with_state_management/modules/cart/stores/cart_store.dart';
import '../stores/setting/setting_store.dart';

///
/// BottomNavBarWidget
///
class BottomNavBarWidget extends StatefulWidget {
  final SettingStore settingStore;
  const BottomNavBarWidget(this.settingStore, {super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  
  @override
  Widget build(BuildContext context) {
    debugPrint('<<<=== BottomNavBarWidget REBUILD');
    
    return BottomNavigationBar(
      currentIndex: widget.settingStore.pageIndex,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Observer(
            builder: (_) {
              return Badge.count(
                count: context.watch<CartStore>().nbCart,
                child: const Icon(Icons.shopping_cart),
              );
            },
          ),
          label: 'View Cart',
        ),
      ],
      onTap: (index) {
        widget.settingStore.navigateTo(index);
      },
    );
  }

}