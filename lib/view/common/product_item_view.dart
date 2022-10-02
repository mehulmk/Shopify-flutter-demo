import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopify/core/app_colors.dart';
import 'package:shopify/core/app_routes.dart';
import 'package:shopify/data/model/product_list.dart';

class ProductItemView extends StatelessWidget {
  const ProductItemView({required this.products, Key? key}) : super(key: key);
  final Products products;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.product, arguments: products.id);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 150,
        width: 150,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.lightBorder),
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: 120,
              width: 118,
              imageUrl: products.image!.src.toString(),
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              products.title!,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w500),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            Text(
              "\$${double.parse(products.variants?.first.price ?? "100").toStringAsFixed(2)}",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: AppColor.blue),
            ),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                text:
                    "\$${(double.parse(products.variants?.first.price ?? "100") * 1.24).toStringAsFixed(2)}",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(decoration: TextDecoration.lineThrough),
                children: const <TextSpan>[
                  TextSpan(
                      text: "  24% off",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.lightError,
                          decoration: TextDecoration.none)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
