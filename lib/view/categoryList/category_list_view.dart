import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopify/core/app_colors.dart';
import 'package:shopify/view/categoryList/category_list_view_model.dart';
import 'package:shopify/view/home/home_category_view.dart';

class CategoryListView extends ConsumerWidget {
  const CategoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final categoryList = watch(categoryListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: categoryList.when(
          data: (list) => GridView.builder(
                itemCount: list.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 10,
                  childAspectRatio: 80 / 95,
                ),
                itemBuilder: (context, index) =>
                    HomeCategoryItemView(collection: list[index]!),
              ),
          loading: () => const SpinKitCircle(color: AppColor.black),
          error: (e, s) => const Text("error")),
    );
  }
}
