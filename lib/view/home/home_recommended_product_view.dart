import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopify/core/app_colors.dart';
import 'package:shopify/core/app_routes.dart';
import 'package:shopify/core/assets.dart';
import 'package:shopify/data/model/collection_list.dart' as collection;
import 'package:shopify/utility/key_util.dart';
import 'package:shopify/view/common/product_item_view.dart';
import 'package:shopify/view/home/home_view_model.dart';

class HomeRecommendedProductView extends ConsumerWidget {
  const HomeRecommendedProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final productsList = watch(homeRecommendedProductsProvider);

    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 16),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.productList,
                arguments: collection.Collection(
                    title: "Recommended Product",
                    id: KeyUtil.recommendedProduct),
              );
            },
            child: Stack(
              children: [
                const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  child: Image(
                    fit: BoxFit.cover,
                    height: 210,
                    image: AssetImage(Assets.recommendedProductBanner),
                  ),
                ),
                Container(
                  height: 210,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recommended \nProduct",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: AppColor.white),
                      ),
                      const SizedBox(height: 24),
                      Text("We recommend the best for you",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(
                                  color: AppColor.white,
                                  fontWeight: FontWeight.w300))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        productsList.when(
            data: (list) => GridView.builder(
                  itemCount: list.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(left: 10, right: 10),
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
            error: (e, s) => const Text("error"))
      ],
    );
  }
}
