import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopify/view/home/home_banner_view.dart';
import 'package:shopify/view/home/home_category_view.dart';
import 'package:shopify/view/home/home_flash_sell_view.dart';
import 'package:shopify/view/home/home_mega_sell_view.dart';
import 'package:shopify/view/home/home_recommended_product_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          HomeBannerView(),
          HomeCategoryView(),
          HomeFlashSellView(),
          HomeMegaSellView(),
          HomeRecommendedProductView(),
          SizedBox(height: 16)
        ],
      ),
    );
  }
}
