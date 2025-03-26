
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provider/provider.dart';
import 'package:using_provider/core/providers/cart_provider.dart';
import 'package:using_provider/core/providers/setting_provider.dart';
import '../../../core/enums/app_enum.dart';
import '../../../core/helpers/image_helper.dart';
import '../../../core/providers/product_provider.dart';
import '../models/product_model.dart';
import '../widgets/product_search_widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    debugPrint('<<<=== ProductScreen REBUILD');
    
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: ProductSearchWidget(),
        ),
        Expanded(
          child: Consumer<ProductProvider>(
            builder: (context, productProvider, _) {

              switch (productProvider.state) {
                case LoadingState.loading:
                  return const Center(child: CircularProgressIndicator());
                case LoadingState.success:
                  return EasyRefresh(
                    header: BallPulseHeader(color: Theme.of(context).colorScheme.primary),
                    footer: BallPulseFooter(color: Theme.of(context).colorScheme.primary),
                    onRefresh: () => productProvider.getList(),
                    onLoad: () => productProvider.getList(loadMore: true),
                    child: GridView.builder(
                      padding: const EdgeInsets.all(12.0),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      mainAxisSpacing: 12.0,
                      crossAxisSpacing: 12.0,
                    ),
                    itemCount: productProvider.products.length,
                    itemBuilder: (context, index) {
            
                      ProductModel product = productProvider.products[index];
                      
                      return Material( 
                        color: context.watch<SettingProvider>().appTheme == ThemeData.dark() ? Colors.white10 : Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        child: InkWell(
                          onTap: () {
                            context.read<CartProvider>().addToCart(product);
                          },
                          borderRadius: BorderRadius.circular(8.0),
                          splashColor: Colors.purple[50],
                          child: Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: ImageHelper.buildImageWidget(productProvider.products[index].image),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  '${product.title}',
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
            }
          ),
        ),
      ],
    );
  }

}