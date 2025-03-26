
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:using_bloc/modules/cart/bloc/cart_cubit.dart';
import 'package:using_bloc/modules/cart/bloc/cart_state.dart';
import 'package:using_bloc/modules/product/model/product_model.dart';
import 'package:using_bloc/modules/setting/bloc/setting_cubit.dart';
import 'package:using_bloc/modules/setting/bloc/setting_state.dart';

///
/// BottomNavBarWidget
///
class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {

    debugPrint('BottomNavBarWidget build');

    return BlocSelector<SettingCubit, SettingState, int>(
      selector: (settingState) => settingState.pageIndex!, 
      builder: (context, pageIndex) {
        return BottomNavigationBar(
          currentIndex: pageIndex,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: BlocSelector<CartCubit, CartState, List<ProductModel>>(
                selector: (state) => state.carts,
                builder: (context, carts) {
                  return Badge.count(
                    count: carts.length,
                    textStyle: const TextStyle(fontSize: 18),
                    offset: const Offset(10, -10),
                    largeSize: 22.0,
                    smallSize: 18.0,
                    child: const Icon(Icons.shopping_cart),
                  );
                },
              ),
              label: 'View Cart',
            ),
          ],
          onTap: (index) {
            context.read<SettingCubit>().navigate(index);
          },
        );
      }
    );

  }
}