import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopify/core/app_colors.dart';
import 'package:shopify/core/app_routes.dart';
import 'package:shopify/data/model/collection_list.dart';
import 'package:shopify/utility/key_util.dart';
import 'package:shopify/view/common/product_item_view.dart';
import 'package:shopify/view/home/home_view_model.dart';

class HomeFlashSellView extends ConsumerWidget {
  const HomeFlashSellView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final productsList = watch(homeFlashSellProductsProvider);

    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Flash Sell",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 16),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.productList,
                    arguments:
                        Collection(title: "Flash Sell", id: KeyUtil.flashSell),
                  );
                },
                child: Text(
                  "See More",
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontSize: 16,
                        color: AppColor.blue,
                      ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 273,
          child: productsList.when(
              data: (list) => ListView.builder(
                    itemCount: list.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        ProductItemView(products: list[index]),
                  ),
              loading: () => const SpinKitCircle(color: AppColor.black),
              error: (e, s) => const Text("error")),
        )
      ],
    );
  }
}
