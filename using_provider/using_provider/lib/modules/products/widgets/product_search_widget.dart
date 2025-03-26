
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:using_provider/core/providers/product_provider.dart';

///
/// [ProductSearchWidget]
///
class ProductSearchWidget extends StatefulWidget {
  const ProductSearchWidget({super.key});

  @override
  State<ProductSearchWidget> createState() => _ProductSearchWidgetState();
}

class _ProductSearchWidgetState extends State<ProductSearchWidget>  {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      onChanged: (value) {
        debugPrint('Search value: $value');
        context.read<ProductProvider>().getList();
      },
    );
  }
}
