import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopify/core/app_colors.dart';
import 'package:shopify/data/model/cart.dart';
import 'package:shopify/data/model/product_list.dart';
import 'package:shopify/data/sharedpref/preferences.dart';
import 'package:shopify/main.dart';
import 'package:shopify/view/cart/cart_view_model.dart';
import 'package:shopify/view/common/common_button.dart';
import 'package:shopify/view/productDetails/product_details_model.dart';
import 'package:shopify/view/productDetails/product_size_selection_view.dart';
import 'package:shopify/view/productDetails/product_specification_view.dart';
import 'package:shopify/view/productDetails/product_you_might_like_view.dart';

class ProductDetailsView extends ConsumerWidget {
  final int id;

  const ProductDetailsView({required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productDetailsProvider(id));

    return products.when(
        data: (product) => Scaffold(
              appBar: AppBar(
                title: Text(product.title.toString()),
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                      items: product.images!
                          .map((e) => ProductBannerItemView(images: e))
                          .toList(),
                      options: CarouselOptions(
                          height: 230,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            ref.read(productBannerIndicator.notifier).state = index;
                          }),
                    ),
                    ProductBannerDotsView(images: product.images),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        product.title!,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontWeight: FontWeight.w600),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.star_rounded,
                            color: Colors.orange,
                            size: 18,
                          ),
                          Icon(
                            Icons.star_rounded,
                            color: Colors.orange,
                            size: 18,
                          ),
                          Icon(
                            Icons.star_rounded,
                            color: Colors.orange,
                            size: 18,
                          ),
                          Icon(
                            Icons.star_rounded,
                            color: Colors.orange,
                            size: 18,
                          ),
                          Icon(
                            Icons.star_rounded,
                            color: Colors.grey,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                    ProductPriceView(variants: product.variants),
                    ProductSizeSelectionView(variants: product.variants),
                    const SizedBox(height: 16),
                    ProductSpecificationView(product: product),
                    ProductYouMightLikeView(productType: product.productType!),
                    const SizedBox(height: 16),
                    CommonButton(
                        label: "Add To Cart",
                        onPressed: () async {
                          await ref
                              .read(sharedPreferencesHelper)
                              .putObjectList(Preferences.cart, [
                            ...ref
                                .read(sharedPreferencesHelper)
                                .getObjectList<Cart>(Preferences.cart,
                                    (map) => Cart.fromJson(map)),
                            Cart(
                                id: product.id,
                                title: product.title,
                                variants: product.variants![ref
                                    .read(productSelectedVariants.notifier)
                                    .state],
                                images: product.images![ref
                                    .read(productSelectedVariants.notifier)
                                    .state],
                                image: product.image)
                          ]);
                          ref.read(cartListProvider).refresh();
                        }),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
        loading: () =>
            const Scaffold(body: SpinKitCircle(color: AppColor.black)),
        error: (e, s) => const Text("error"));
  }
}

class ProductBannerItemView extends StatelessWidget {
  const ProductBannerItemView({required this.images, Key? key})
      : super(key: key);
  final Images images;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: images.src.toString(),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.contain),
        ),
      ),
    );
  }
}

class ProductBannerDotsView extends ConsumerWidget {
  const ProductBannerDotsView({required this.images, Key? key})
      : super(key: key);
  final List<Images>? images;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indicator = ref.watch(productBannerIndicator.notifier).state;

    return (images == null || images!.length <= 1)
        ? const SizedBox()
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images!.asMap().entries.map((entry) {
              return Container(
                width: 9,
                height: 9,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.blue
                        .withOpacity(indicator == entry.key ? 1 : 0.3)),
              );
            }).toList(),
          );
  }
}

class ProductPriceView extends ConsumerWidget {
  const ProductPriceView({required this.variants, Key? key}) : super(key: key);
  final List<Variants>? variants;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedVariant = ref.watch(productSelectedVariants.notifier).state;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        "\$${variants![selectedVariant].price!}",
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: AppColor.blue, fontWeight: FontWeight.w900),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
