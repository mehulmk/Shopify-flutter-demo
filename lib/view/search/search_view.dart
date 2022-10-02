import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopify/core/app_colors.dart';
import 'package:shopify/view/home/home_category_view.dart';
import 'package:shopify/view/search/search_view_model.dart';

class SearchView extends ConsumerWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final manCategoryList = ref.watch(manCategoryListProvider);
    final womanCategoryList = ref.watch(womanCategoryListProvider);

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            border: Border.all(color: AppColor.lightBorder, width: 1),
          ),
          child: const TextField(
            decoration: InputDecoration(
                fillColor: AppColor.whiteLightest,
                isDense: true,
                contentPadding:
                    EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                hintText: "Search Product"),
          ),
        ),
        const Divider(color: AppColor.lightBorder, height: 1),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 16, bottom: 6),
                  child: Text(
                    "Man Fashion",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontSize: 16),
                  ),
                ),
                manCategoryList.when(
                    data: (list) => GridView.builder(
                          itemCount: list.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(10),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
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
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 16, bottom: 6),
                  child: Text(
                    "Woman Fashion",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontSize: 16),
                  ),
                ),
                womanCategoryList.when(
                    data: (list) => GridView.builder(
                          itemCount: list.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(10),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
