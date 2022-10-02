import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopify/core/app_colors.dart';
import 'package:shopify/data/model/product_list.dart';
import 'package:shopify/view/productDetails/product_details_model.dart';

class ProductSizeSelectionView extends ConsumerWidget {
  const ProductSizeSelectionView({required this.variants, Key? key})
      : super(key: key);
  final List<Variants>? variants;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final selectedVariant = watch(productSelectedVariants).state;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            "Select Size",
            style:
                Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 20),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          height: 50,
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemCount: variants!.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                context.read(productSelectedVariants).state = index;
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.symmetric(horizontal: 6),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: selectedVariant == index
                          ? AppColor.blue
                          : Colors.black12),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  shape: BoxShape.rectangle,
                ),
                child: Text(
                  variants![index].title!,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith( fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
