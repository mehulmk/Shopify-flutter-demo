import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopify/main.dart';
import 'package:shopify/utility/key_util.dart';

final manCategoryListProvider = FutureProvider((ref) {
  return Future.wait(KeyUtil.searchCategoryList[0]
      .map((e) => ref.read(apiRepository).getCollectionsById(e))
      .toList());
});

final womanCategoryListProvider = FutureProvider((ref) {
  return Future.wait(KeyUtil.searchCategoryList[1]
      .map((e) => ref.read(apiRepository).getCollectionsById(e))
      .toList());
});
