import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopify/core/app_colors.dart';
import 'package:shopify/view/account/account_view.dart';
import 'package:shopify/view/cart/cart_view.dart';
import 'package:shopify/view/home/home_view.dart';
import 'package:shopify/view/main/main_view_model.dart';
import 'package:shopify/view/offer/offer_view.dart';
import 'package:shopify/view/search/search_view.dart';

class MainView extends ConsumerWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final bottomSelectedItem = watch(bottomSelectedItemProvider).state;

    return Scaffold(
      appBar: AppBar(
        title: Text([
          "Shopify",
          "Search",
          "Your Cart",
          "Offer",
          "Account"
        ][bottomSelectedItem]),
      ),
      body: [
        const HomeView(),
        const SearchView(),
        const CartView(),
        const OfferView(),
        const AccountView(),
      ][bottomSelectedItem],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomSelectedItem,
        onTap: (index) {
          context.read(bottomSelectedItemProvider).state = index;
        },
        selectedItemColor: AppColor.blue,
        unselectedItemColor: AppColor.lightDivider,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_outlined), label: "Offer"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: "Account"),
        ],
      ),
    );
  }
}
