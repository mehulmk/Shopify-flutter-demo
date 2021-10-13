import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopify/main.dart';
import 'package:shopify/utility/key_util.dart';

final categoryListProvider = FutureProvider((ref) {
  return Future.wait(KeyUtil.categoryList
      .map((e) => ref.read(apiRepository).getCollectionsById(e))
      .toList());
});
