
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:using_bloc/modules/product/bloc/product_cubit.dart';

///
/// [ProductSearchWidget]
///
class ProductSearchWidget extends StatefulWidget {
  const ProductSearchWidget({super.key});

  @override
  State<ProductSearchWidget> createState() => _ProductSearchWidgetState();
}

class _ProductSearchWidgetState extends State<ProductSearchWidget> with RestorationMixin  {

  Timer? debounce;

  final RestorableTextEditingController _controller = RestorableTextEditingController();

  @override
  String? get restorationId => 'ProductSearchWidget';
  
  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_controller, 'controller');
  }

  @override
  void dispose() {
    debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller.value,
      decoration: const InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      onChanged: (value) {
        debugPrint('Search value: $value');
        if (debounce?.isActive ?? false) debounce?.cancel();
        debounce = Timer(Duration(milliseconds: 500), () {
          context.read<ProductCubit>().getList();
        });
      },
    );
  }
  
}
