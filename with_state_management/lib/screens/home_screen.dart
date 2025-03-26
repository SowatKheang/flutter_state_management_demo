
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modules/cart/stores/cart_store.dart';

///
/// HomeScreen: Display a grid of items
///
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, CartStore cartStore, child) {
        return GridView.builder(
          padding: const EdgeInsets.all(12.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            mainAxisSpacing: 12.0, 
            crossAxisSpacing: 12.0
          ),
          itemCount: 30,
          itemBuilder: (context, index) {
            return Material( 
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              child: InkWell(
                onTap: cartStore.addToCart,
                borderRadius: BorderRadius.circular(8.0),
                splashColor: Colors.purple[50],
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://picsum.photos/400/400?random=$index',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Item ${index + 1}',
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
        );
      },
    );
  }
}