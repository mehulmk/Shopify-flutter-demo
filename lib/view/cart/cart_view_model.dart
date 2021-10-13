import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopify/data/model/cart.dart';
import 'package:shopify/data/sharedpref/preferences.dart';
import 'package:shopify/main.dart';
import 'package:tuple/tuple.dart';

final totalAmountProvider = StateProvider((ref) {
  return ref
      .watch(cartListProvider)
      .list
      .map((e) => Tuple2(double.parse(e.variants!.price!), e.count!))
      .fold<double>(
      0.0,
          (previousValue, element) =>
      previousValue + element.item1 * element.item2);
});

final refreshCart = StateProvider((ref) => false);

final cartListProvider = ChangeNotifierProvider((ref) {
  return CartList(ref);
});

class CartList extends ChangeNotifier {
  List<Cart> list = [];
  ProviderReference ref;

  CartList(this.ref) {
    refresh();
  }

  void refresh() {
    list = ref
        .read(sharedPreferencesHelper)
        .getObjectList(Preferences.cart, (v) => Cart.fromJson(v));
    notifyListeners();
  }

  void increment(int index) {
    list[index].count = list[index].count! + 1;
    notifyListeners();
  }

  void decrement(int index) {
    if (list[index].count! > 1) {
      list[index].count = list[index].count! - 1;
      notifyListeners();
    }
  }
}
