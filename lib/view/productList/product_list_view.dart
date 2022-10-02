import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopify/core/app_colors.dart';
import 'package:shopify/data/model/collection_list.dart';
import 'package:shopify/view/common/product_item_view.dart';
import 'package:shopify/view/productList/product_list_model.dart';

class ProductListView extends ConsumerWidget {
  const ProductListView({required this.collection, Key? key}) : super(key: key);
  final Collection collection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsList =ref. watch(productListProductsProvider(collection.id!));

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(collection.title!),
      ),
      body: productsList.when(
          data: (list) => GridView.builder(
                itemCount: list.length,
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 10,
                  childAspectRatio: 150 / 240,
                ),
                itemBuilder: (context, index) =>
                    ProductItemView(products: list[index]),
              ),
          loading: () => const SpinKitCircle(color: AppColor.black),
          error: (e, s) =>  Text(s.toString())),
    );
  }
}
