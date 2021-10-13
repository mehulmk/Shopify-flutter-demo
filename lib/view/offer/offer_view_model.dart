import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopify/main.dart';
import 'package:shopify/utility/key_util.dart';

final offerListProvider = FutureProvider((ref) {
  return Future.wait(KeyUtil.offerList
      .map((e) => ref.read(apiRepository).getCollectionsById(e))
      .toList());
});
