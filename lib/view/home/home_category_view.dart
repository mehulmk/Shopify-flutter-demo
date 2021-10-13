import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopify/core/app_colors.dart';
import 'package:shopify/core/app_routes.dart';
import 'package:shopify/data/model/collection_list.dart';
import 'package:shopify/view/home/home_view_model.dart';

class HomeCategoryView extends ConsumerWidget {
  const HomeCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final homeCategoryList = watch(homeCategoryListProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Category",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 16),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.categoryList);
                },
                child: Text(
                  "More Category",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontSize: 16, color: AppColor.blue),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 111,
          child: homeCategoryList.when(
              data: (list) => ListView.builder(
                    itemCount: list.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        HomeCategoryItemView(collection: list[index]!),
                  ),
              loading: () => const SpinKitCircle(color: AppColor.black),
              error: (e, s) => const Text("error")),
        )
      ],
    );
  }
}

class HomeCategoryItemView extends StatelessWidget {
  const HomeCategoryItemView({required this.collection, Key? key})
      : super(key: key);
  final Collection collection;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.productList,
          arguments: collection,
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            height: 80,
            width: 80,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.lightBorder),
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImage(
              imageUrl: collection.image!.src.toString(),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            collection.title!,
            style: Theme.of(context).textTheme.bodyText2,
            maxLines: 1,
            overflow: TextOverflow.fade,
          )
        ],
      ),
    );
  }
}
