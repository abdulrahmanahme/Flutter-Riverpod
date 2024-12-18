import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2/shop/product_shop_model/product_shop_model.dart';

final List<ProductShopModel> productShopModel = [
  const ProductShopModel(
      id: '1',
      image: 'assets/images/artichoke.png',
      name: 'artichoke',
      price: 65),
  const ProductShopModel(
      id: '2', image: 'assets/images/arugula.png', name: 'arugula', price: 75),
  const ProductShopModel(
      id: '3', image: 'assets/images/avocado.png', name: 'avocado', price: 62),
  const ProductShopModel(
      id: '4', image: 'assets/images/olives.png', name: 'olives', price: 65),
  const ProductShopModel(
      id: '5',
      image: 'assets/images/radicchio.png',
      name: 'radicchio',
      price: 33),
  const ProductShopModel(
      id: '6', image: 'assets/images/perilla.png', name: 'perilla', price: 74),
];

final productShop = Provider((ref) => productShopModel);

final filterProductShop = Provider((ref) {
  return productShopModel.where((product) => product.price > 50).toList();
});
