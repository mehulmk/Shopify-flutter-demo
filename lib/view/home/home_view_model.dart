import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopify/data/model/product_list.dart';
import 'package:shopify/data/repository/api_repository.dart';
import 'package:shopify/main.dart';
import 'package:shopify/utility/key_util.dart';

final homeProvider = ChangeNotifierProvider<HomeViewModel>((ref) {
  return HomeViewModel(apiRepository: ref.read(apiRepository));
});

class HomeViewModel with ChangeNotifier {
  final ApiRepository apiRepository;
  List<Products> productList = [];

  HomeViewModel({required this.apiRepository}) {
    apiRepository.getProducts().then((value) {
      productList = value;
      notifyListeners();
    }, onError: (e) {
      print(e);
    });
  }
}

final customCollectionListProvider = FutureProvider((ref) {
  return ref.read(apiRepository).getCustomCollections();
});

final homeBannerListProvider = FutureProvider((ref) {
  return Future.wait(KeyUtil.homeBanner
      .map((e) => ref.read(apiRepository).getCollectionsById(e))
      .toList());
});

final homeBannerIndicator = StateProvider((ref) => 0);

final homeCategoryListProvider = FutureProvider((ref) {
  return Future.wait(KeyUtil.homeCategory
      .map((e) => ref.read(apiRepository).getCollectionsById(e))
      .toList());
});

final homeFlashSellProductsProvider = FutureProvider((ref) {
  return ref.read(apiRepository).getProductsByCollectionId(KeyUtil.flashSell);
});

final homeMegaSellProductsProvider = FutureProvider((ref) {
  return ref.read(apiRepository).getProductsByCollectionId(KeyUtil.megaSell);
});

final homeRecommendedProductsProvider = FutureProvider((ref) {
  return ref
      .read(apiRepository)
      .getProductsByCollectionId(KeyUtil.recommendedProduct);
});
