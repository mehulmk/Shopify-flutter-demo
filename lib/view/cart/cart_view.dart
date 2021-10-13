import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopify/core/app_colors.dart';
import 'package:shopify/data/model/cart.dart';
import 'package:shopify/data/sharedpref/preferences.dart';
import 'package:shopify/main.dart';
import 'package:shopify/view/cart/cart_view_model.dart';
import 'package:shopify/view/common/common_button.dart';

class CartView extends ConsumerWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final cartList = watch(cartListProvider).list;
    final totalAmount = watch(totalAmountProvider).state;

    return (cartList.isEmpty)
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 48,
                  color: AppColor.blue,
                ),
                SizedBox(height: 16),
                Text("Your cart is empty!!"),
              ],
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: cartList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                          height: 116,
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.lightBorder),
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4))),
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                height: 80,
                                width: 80,
                                alignment: Alignment.center,
                                imageUrl: cartList[index].images?.src ??
                                    cartList[index].image!.src.toString(),
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "${cartList[index].title} ${cartList[index].variants!.title}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            await context
                                                .read(sharedPreferencesHelper)
                                                .putObjectList(
                                                    Preferences.cart, [
                                              ...context
                                                  .read(sharedPreferencesHelper)
                                                  .getObjectList<Cart>(
                                                      Preferences.cart,
                                                      (map) =>
                                                          Cart.fromJson(map))
                                                ..removeAt(index)
                                            ]);
                                            context
                                                .read(cartListProvider)
                                                .refresh();
                                          },
                                          child: const Icon(
                                            Icons.delete_outline_rounded,
                                            color: AppColor.lightBorder,
                                          ),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "\$${cartList[index].variants!.price}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(color: AppColor.blue),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColor.lightBorder),
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(4))),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    context
                                                        .read(cartListProvider)
                                                        .decrement(index);
                                                  },
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8),
                                                    child: Icon(
                                                      Icons.remove,
                                                      size: 16,
                                                    ),
                                                  )),
                                              Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 8,
                                                      vertical: 4),
                                                  color: AppColor.lightBorder,
                                                  child: Text(cartList[index]
                                                      .count
                                                      .toString())),
                                              InkWell(
                                                  onTap: () {
                                                    context
                                                        .read(cartListProvider)
                                                        .increment(index);
                                                  },
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8),
                                                    child: Icon(
                                                      Icons.add,
                                                      size: 16,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.lightBorder),
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Items (${cartList.length})"),
                        Text("\$${totalAmount.toStringAsFixed(2)}"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Shipping"),
                        Text("\$40.00"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("GST (18%)"),
                        Text("\$${(totalAmount * 0.18).toStringAsFixed(2)}")
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(color: AppColor.lightBorder),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Price",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.black),
                        ),
                        Text(
                            "\$${(totalAmount + 40 + totalAmount * 0.18).toStringAsFixed(2)}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.blue))
                      ],
                    ),
                  ],
                ),
              ),
              CommonButton(label: "Check Out", onPressed: () async {}),
              const SizedBox(height: 16),
            ],
          );
  }
}
