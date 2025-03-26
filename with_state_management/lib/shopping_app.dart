
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:with_state_management/core/stores/setting/setting_store.dart';
import 'package:with_state_management/core/widgets/bottom_navbar_widget.dart';
import 'package:with_state_management/screens/home_screen.dart';
import 'core/helpers/app_helper.dart';
import 'modules/cart/screens/cart_screen.dart';
import 'modules/cart/stores/cart_store.dart';

///
/// ShoppingApp
///
class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Rebuild the whole widget");

    return MultiProvider(
      providers: [
        // Dependencies Injection
        Provider<SettingStore>(
          create: (_) => SettingStore(),
        ),
        Provider<CartStore>(
          create: (_) => CartStore(),
        ),
      ],

      child: Consumer<SettingStore>(
        builder: (context, settingStore, child) {
          return Observer(
            builder: (context) {
              return MaterialApp(
                title: AppHelper.appName,
                theme: settingStore.appTheme,
                home: Scaffold(
                  appBar: AppBar(
                    title: const Text('With State Management'),
                    actions: [
                      IconButton(
                        onPressed: () => settingStore.changeTheme(), 
                        icon: Icon(settingStore.isDark ? Icons.light_mode : Icons.dark_mode)
                      )
                    ],
                  ),
                  body: IndexedStack(
                    index: settingStore.pageIndex,
                    children: const [
                      HomeScreen(),
                      CartScreen(),
                    ],
                  ),
                  bottomNavigationBar: BottomNavBarWidget(settingStore)
                ),
              );
            },
          );
        } ,
      ),
    );
  }

}
