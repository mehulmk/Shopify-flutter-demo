import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopify/data/model/product_list.dart';
import 'package:shopify/view/productDetails/product_details_model.dart';

class ProductSpecificationView extends StatelessWidget {
  const ProductSpecificationView({required this.product, Key? key})
      : super(key: key);
  final Products product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Specification",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Vendor :",
                    style: Theme.of(context).textTheme.subtitle1!,
                  ),
                  Text(product.vendor!),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Product Type :",
                    style: Theme.of(context).textTheme.subtitle1!,
                  ),
                  Text(product.productType!),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    "Tags :",
                    style: Theme.of(context).textTheme.subtitle1!,
                  ),
                  Expanded(
                    child: Text(
                      product.tags!.split(", ").join("/"),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sku :",
                    style: Theme.of(context).textTheme.subtitle1!,
                  ),
                  ProductVariantsSukView(variants: product.variants),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Html(data: product.bodyHtml.toString()),
        )
      ],
    );
  }
}

class ProductVariantsSukView extends ConsumerWidget {
  const ProductVariantsSukView({required this.variants, Key? key})
      : super(key: key);
  final List<Variants>? variants;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final selectedVariant = watch(productSelectedVariants).state;

    return Text(variants![selectedVariant].sku.toString());
  }
}
