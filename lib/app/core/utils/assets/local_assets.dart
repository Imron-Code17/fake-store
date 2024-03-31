import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocalAssets {
  static image(String assets, {double? height, double? width}) {
    return Image.asset(
      assets,
      height: height,
      width: width,
    );
  }

  static svg(String assets, {Color? color, double? height, double? width}) {
    return SvgPicture.asset(
      assets,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      height: height,
      width: width,
    );
  }
}
