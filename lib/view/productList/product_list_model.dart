import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopify/data/model/product_list.dart';
import 'package:shopify/main.dart';

final productListProductsProvider =
    FutureProvider.family<List<Products>, int>((ref, id) {
  return ref.read(apiRepository).getProductsByCollectionId(id);
});
