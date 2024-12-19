import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2/shop/cart_provider/cart_provider.dart';

class CartProductScreen extends ConsumerStatefulWidget {
  const CartProductScreen({super.key});
  @override
  ConsumerState<CartProductScreen> createState() => _CartProductScreenState();
}

class _CartProductScreenState extends ConsumerState<CartProductScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProduct = ref.watch(cartNotifierProvider);
    final totalInCartProvider = ref.watch(totalInCart);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Cart',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          ...cartProduct.map((cartProduct) {
            return Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              color: Colors.grey.withOpacity(.05),
              child: Row(
                spacing: 10,
                children: [
                  const SizedBox(
                    width: 7,
                  ),
                  Image.asset(
                    height: 60,
                    width: 60,
                    cartProduct.image,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: Text(
                      cartProduct.name,
                      maxLines: 3,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  Text(
                    cartProduct.price.toString(),
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                ],
              ),
            );
          }).toList(),
          Center(
            child: Text(
              totalInCartProvider.toString(),
              style: const TextStyle(color: Colors.black, fontSize: 20,
              fontWeight: FontWeight.w600),
            ),
          ),
        ]),
      ),
    );
  }
}
