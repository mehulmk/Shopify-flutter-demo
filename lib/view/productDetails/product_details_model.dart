import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopify/data/model/product_list.dart';
import 'package:shopify/main.dart';

final productDetailsProvider =
    FutureProvider.autoDispose.family<Products, int>((ref, id) {
  return ref.read(apiRepository).getProductsById(id);
});
final productBannerIndicator = StateProvider.autoDispose((ref) => 0);
final productSelectedVariants = StateProvider.autoDispose((ref) => 0);

final productYouMightLikeProvider = FutureProvider.autoDispose
    .family<List<Products>, String>((ref, productType) {
  return ref.read(apiRepository).getProductsByProductType(productType);
});
