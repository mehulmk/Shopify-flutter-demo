import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shopify/core/color_scheme.dart';

class CommonButton extends StatelessWidget {
  final String label;
  final bool isLoading;
  final Function onPressed;
  final double padding;
  final double height;
  final FontWeight fontWeight;

  const CommonButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.padding = 16,
    this.height = 56,
    this.fontWeight = FontWeight.bold,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Theme.of(context).colorScheme.baseColor,
                  fontWeight: fontWeight),
            ),
            Visibility(
              visible: isLoading,
              child: SpinKitCircle(
                size: 24,
                color: Theme.of(context).colorScheme.baseColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
