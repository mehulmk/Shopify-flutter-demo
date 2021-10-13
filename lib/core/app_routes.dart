import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopify/data/model/collection_list.dart';
import 'package:shopify/view/categoryList/category_list_view.dart';
import 'package:shopify/view/home/home_view.dart';
import 'package:shopify/view/main/main_view.dart';
import 'package:shopify/view/productDetails/product_details_view.dart';
import 'package:shopify/view/productList/product_list_view.dart';

abstract class AppRoutes {
  static const main = '/';
  static const productList = '/product-list';
  static const product = '/product';
  static const categoryList = '/category-list';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        settings: settings,
        builder: (_) {
          switch (settings.name) {
            case main:
              return const MainView();
            case productList:
              return ProductListView(
                  collection: settings.arguments as Collection);
            case product:
              return ProductDetailsView(id: settings.arguments as int);
            case categoryList:
              return const CategoryListView();
            default:
              return const HomeView();
          }
        });
  }
}
