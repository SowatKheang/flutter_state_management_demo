
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:using_bloc/core/enum/app_enum.dart';
import 'package:using_bloc/modules/product/bloc/product_cubit.dart';
import 'package:using_bloc/modules/setting/bloc/setting_cubit.dart';
import 'package:using_bloc/modules/setting/bloc/setting_state.dart';
import 'core/widgets/bottom_navbar_widget.dart';
import 'modules/cart/bloc/cart_cubit.dart';
import 'modules/cart/screen/cart_screen.dart';
import 'modules/product/screen/product_screen.dart';

///
/// [ShoppingApp]
///
class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => SettingCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => ProductCubit()..getList(),
        ),
        BlocProvider(
          create: (BuildContext context) => CartCubit(),
        ),
      ], 
      child: BlocSelector<SettingCubit, SettingState, int>(
        selector: (state) => state.theme!,
        builder: (context, theme) {
          return MaterialApp(
            restorationScopeId: 'shopping_app',
            theme: theme == AppTheme.dark.index
              ? ThemeData.dark().copyWith(
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.black,
                ),
              )
            : ThemeData.light().copyWith(
              appBarTheme: AppBarTheme(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary
              ),
            ),
            home: Scaffold(
              appBar: AppBar(
                title: const Text('Bloc with Cubit State Management'),
                actions: [
                  IconButton(
                    onPressed: () => context.read<SettingCubit>().toggleTheme(), 
                    icon: Icon(theme == AppTheme.dark.index ? Icons.light_mode : Icons.dark_mode)
                  )
                ],
              ),
              body: const ShoppingAppPage(),
              bottomNavigationBar: const BottomNavBarWidget()
            ),
          );
        },
      ),
    );
  }
}

///
/// [ShoppingAppPage] 
///
class ShoppingAppPage extends StatelessWidget {
  const ShoppingAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('ShoppingAppPage build');
    return BlocSelector<SettingCubit, SettingState, int>(
      selector: (state) => state.pageIndex!,
      builder: (context, pageIndex) {
        return IndexedStack(
          index: pageIndex,
          children: const [
            ProductScreen(),
            CartScreen(),
          ],
        );
      },
    );

  }
}