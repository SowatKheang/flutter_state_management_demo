

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:using_bloc/core/helper/image_helper.dart';
import 'package:using_bloc/core/helper/log_helper.dart';
import 'package:using_bloc/modules/product/widget/product_search_widget.dart';
import 'package:using_bloc/modules/setting/bloc/setting_cubit.dart';
import '../../../core/enum/app_enum.dart';
import '../../cart/bloc/cart_cubit.dart';
import '../bloc/product_cubit.dart';
import '../bloc/product_state.dart';
import '../model/product_model.dart';

///
/// HomeScreen: Display a grid of items
///
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {

    LogHelper.getInstance().info('ProductScreen build');

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: ProductSearchWidget(),
        ),
        Expanded(
          child: BlocBuilder<ProductCubit, ProductState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
            switch (state.loadingState) {
              case LoadingState.loading:
                return const Center(child: CircularProgressIndicator());
              case LoadingState.success:
                return EasyRefresh(
                  header: BallPulseHeader(color: Theme.of(context).colorScheme.primary),
                  footer: BallPulseFooter(color: Theme.of(context).colorScheme.primary),
                  onRefresh: () => context.read<ProductCubit>().getList(),
                  onLoad: () => context.read<ProductCubit>().getList(loadMore: true),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(12.0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 12.0,
                  ),
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
          
                    ProductModel product = state.products[index];
                    return Material( 
                      color: context.watch<SettingCubit>().state.isDarkTheme ? Colors.white10 : Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      child: InkWell(
                        onTap: () {
                          context.read<CartCubit>().add(context, product);
                        },
                        borderRadius: BorderRadius.circular(8.0),
                        splashColor: Colors.purple[50],
                        child: Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: ImageHelper.buildImageWidget(
                                  state.products[index].image,
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                product.title ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple
                                ),
                              ),
                              trailing: const Icon(Icons.add_shopping_cart),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
              case LoadingState.error:
                return const Center(child: Text('Error'));
            }
          }),
        ),
      ],
    );
  }
}
