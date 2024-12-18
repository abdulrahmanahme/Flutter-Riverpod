import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2/shop/product_provider/product_provider.dart';

class ShopProductScreen extends ConsumerWidget {
  const ShopProductScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final shopProduct = ref.watch(productShop);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shop Product',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
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
                spacing: 10,
                children: [
                  const SizedBox(
                    height: 7,
                  ),
                  Image.asset(
                    height: 60,
                    width: 60,
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
