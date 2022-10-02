import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopify/core/app_colors.dart';
import 'package:shopify/core/app_routes.dart';
import 'package:shopify/data/model/collection_list.dart';
import 'package:shopify/view/home/home_view_model.dart';

class HomeBannerView extends ConsumerWidget {
  const HomeBannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final collectionList = watch(homeBannerListProvider);
    final indicator = watch(homeBannerIndicator).state;

    return collectionList.when(
        data: (list) => Column(
              children: [
                CarouselSlider(
                  items: list
                      .map((e) => HomeBannerItemView(collection: e!))
                      .toList(),
                  options: CarouselOptions(
                      height: 230,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        context.read(homeBannerIndicator).state = index;
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: list.asMap().entries.map((entry) {
                    return Container(
                      width: 9,
                      height: 9,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 3),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.blue
                              .withOpacity(indicator == entry.key ? 1 : 0.3)),
                    );
                  }).toList(),
                ),
              ],
            ),
        loading: () => const SizedBox(
            height: 230, child: SpinKitCircle(color: AppColor.black)),
        error: (e, s) => const Text("error"));
  }
}

class HomeBannerItemView extends StatelessWidget {
  const HomeBannerItemView({required this.collection, Key? key})
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
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: collection.image!.src.toString(),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16),
                child: Text(
                  collection.title.toString(),
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
