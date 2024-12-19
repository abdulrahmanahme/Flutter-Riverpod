import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2/shop/cart_provider/cart_provider.dart';
import 'package:riverpod2/shop/product_provider/product_provider.dart';
import 'package:riverpod2/shop/view/cart_product_screen.dart';

class ShopProductScreen extends ConsumerWidget {
  const ShopProductScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final shopProduct = ref.watch(productShop);
    final carProvider = ref.watch(cartNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shop Product',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        actions: const [CartIconWidget()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: .9,
          ),
          itemCount: shopProduct.length, // Total number of items
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                spacing: 5,
                children: [
                  const SizedBox(
                    height: 7,
                  ),
                  Image.asset(
                    height: 40,
                    width: 40,
                    shopProduct[index].image,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    shopProduct[index].name,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Text(
                    shopProduct[index].price.toString(),
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  if (carProvider.contains(shopProduct[index]))
                    TextButton(
                      onPressed: () {
                        ref
                            .read(cartNotifierProvider.notifier)
                            .removeProduct(shopProduct[index]);
                      },
                      child: const Text(
                        'Remove',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ),
                  if (!carProvider.contains(shopProduct[index]))
                    TextButton(
                      onPressed: () {
                        ref
                            .read(cartNotifierProvider.notifier)
                            .addProduct(shopProduct[index]);
                      },
                      child: const Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CartIconWidget extends ConsumerWidget {
  const CartIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final totalCartNumber = ref.watch(cartNotifierProvider);

    log('AAAAAAAA');
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CartProductScreen(),
          ),
        );
      },
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          const Icon(
            Icons.shopping_basket,
            size: 25,
            color: Colors.black,
          ),
          Positioned(
            // top: 10,
            right: 20,
            bottom: 10,

            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.green),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  totalCartNumber.length.toString(),
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
