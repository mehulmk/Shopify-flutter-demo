import 'package:flutter/material.dart';
import 'package:shopify/core/app_colors.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.account_circle_outlined,
                size: 32,
                color: AppColor.blue,
              ),
              const SizedBox(width: 16),
              Text(
                "Profile",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 16),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(
                Icons.list_alt_sharp,
                size: 32,
                color: AppColor.blue,
              ),
              const SizedBox(width: 16),
              Text(
                "Order",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 16),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 32,
                color: AppColor.blue,
              ),
              const SizedBox(width: 16),
              Text(
                "Address",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 16),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(
                Icons.payment_outlined,
                size: 32,
                color: AppColor.blue,
              ),
              const SizedBox(width: 16),
              Text(
                "Payment",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(fontSize: 16),
              )
            ],
          ),
        ],
      ),
    );
  }
}
