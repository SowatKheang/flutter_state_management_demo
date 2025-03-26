
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_provider/core/enums/app_enum.dart';
import 'package:using_provider/core/providers/cart_provider.dart';
import 'package:using_provider/core/providers/product_provider.dart';
import 'core/providers/setting_provider.dart';
import 'core/widgets/bottom_nav_bar_widget.dart';
import 'modules/products/screens/cart_screen.dart';
import 'modules/products/screens/product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SettingProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()..getList()),
        ChangeNotifierProvider(create: (context) => CartProvider())
      ],
      child: Consumer<SettingProvider>(
        builder: (_, settingProvider, __) {
          debugPrint('<<<=== APP_THEME_CHANGE: ${settingProvider.appTheme}');
          return MaterialApp(
            title: 'Flutter Demo Provider',
            theme: settingProvider.appTheme,
            home: const MyHomePage(title: 'Flutter Demo Provider'),
          );
        },
      ),
    );
  }
}

///
/// [MyHomePage]
///
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    debugPrint('<<<=== MyHomePage REBUILD');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () => context.read<SettingProvider>().changeTheme(), 
            icon: Icon(context.read<SettingProvider>().appTheme == ThemeData.dark() ? Icons.light_mode : Icons.dark_mode)
          ),
        ],
      ),
      body: context.watch<SettingProvider>().pageIndex == PageEnum.product.index 
        ? const ProductScreen()
        : const CartScreen(),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
