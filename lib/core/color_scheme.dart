import 'package:flutter/material.dart';
import 'package:shopify/core/app_colors.dart';

extension CustomColorScheme on ColorScheme {
  Color get baseColor =>
      brightness == Brightness.light ? AppColor.white : AppColor.black;

  Color get baseLightColor => brightness == Brightness.light
      ? AppColor.whiteLight
      : AppColor.blackLight;

  Color get crossColor =>
      brightness == Brightness.light ? AppColor.black : AppColor.white;

  Color get crossLightColor => brightness == Brightness.light
      ? AppColor.blackLight
      : AppColor.whiteLight;

  Color get shimmerBaseColor => brightness == Brightness.light
      ? AppColor.whiteLight
      : AppColor.blackLight;

  Color get shimmerHighlightColor =>
      brightness == Brightness.light ? const Color(0xffececec) : const Color(0xff858585);

  Color get success => brightness == Brightness.light
      ? AppColor.lightSuccess
      : AppColor.darkSuccess;

  Color get pink =>
      brightness == Brightness.light ? AppColor.lightPink : AppColor.darkPink;

  Color get iconColor => brightness == Brightness.light
      ? AppColor.blackLight
      : AppColor.whiteLight;

  Color get settingsDividerColor => brightness == Brightness.light
      ? AppColor.settingsLightDivider
      : AppColor.settingsDarkDivider;

  Color get borderColor => brightness == Brightness.light
      ? AppColor.lightBorder
      : AppColor.darkBorder;

  Color get msgColor => brightness == Brightness.light
      ? AppColor.lightMsg
      : AppColor.darkMsg;

  Color get filterColor => brightness == Brightness.light
      ? AppColor.lightFilter
      : AppColor.darkFilter;
}
