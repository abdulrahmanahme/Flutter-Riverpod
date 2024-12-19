import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2/shop/product_shop_model/product_shop_model.dart';

class CartProvider extends Notifier<Set<ProductShopModel>> {
  @override
  Set<ProductShopModel> build() {
    return const {
      // ProductShopModel(
      //     id: '1',
      //     image: 'assets/images/artichoke.png',
      //     name: 'artichoke',
      //     price: 65),
    };
  }

  void addProduct(ProductShopModel product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(ProductShopModel product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}

final totalInCart = Provider((ref) {
  var totalProducts = ref.watch(cartNotifierProvider);
  int total = 0;
  for (var product in totalProducts) {
    total += product.price;
  }
  return total;
});

final cartNotifierProvider =
    NotifierProvider<CartProvider, Set<ProductShopModel>>(
  () => CartProvider(),
);
