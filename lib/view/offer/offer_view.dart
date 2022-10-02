import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopify/core/app_colors.dart';
import 'package:shopify/core/app_routes.dart';
import 'package:shopify/view/offer/offer_view_model.dart';

class OfferView extends ConsumerWidget {
  const OfferView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final offerList = watch(offerListProvider);

    return offerList.when(
        data: (list) => ListView(
              shrinkWrap: true,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppColor.blue,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Text("Use \"MEGSL\" Coupon For \nGet 90%off",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                ...list
                    .map((e) => InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.productList,
                              arguments: e,
                            );
                          },
                          child: Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: SizedBox(
                              height: 210,
                              child: Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: e!.image!.src.toString(),
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(6)),
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, bottom: 16),
                                      child: Text(
                                        e.title.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ))
                    .toList()
              ],
            ),
        loading: () => const SpinKitCircle(color: AppColor.black),
        error: (e, s) => const Text("error"));
  }
}
