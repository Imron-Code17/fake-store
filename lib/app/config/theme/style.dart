import 'package:fakestore/app/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/constant.dart';

class AppStyle {
  BorderRadius get borderRadius => BorderRadius.zero;
  EdgeInsets get padding => EdgeInsets.zero;
  Border get boder => Border.all(color: kBorder);
  List<BoxShadow> get shadow => <BoxShadow>[];
  double get fullHeight =>
      MediaQuery.of(navigatorKey.currentContext!).size.height;
  double get fullWidth =>
      MediaQuery.of(navigatorKey.currentContext!).size.width;
}

extension BorderStyleExtensions on BorderRadius {
  BorderRadius get allSmall => BorderRadius.circular(8.r);
  BorderRadius get topSmall => BorderRadius.only(
      topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r));
  BorderRadius get bottomSmall => BorderRadius.only(
      bottomLeft: Radius.circular(8.r), bottomRight: Radius.circular(8.r));

  BorderRadius get allMedium => BorderRadius.circular(12.r);
  BorderRadius get topMedium => BorderRadius.only(
      topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r));
  BorderRadius get bottomMedium => BorderRadius.only(
      bottomLeft: Radius.circular(12.r), bottomRight: Radius.circular(12.r));

  BorderRadius get allLarge => BorderRadius.circular(16.r);
  BorderRadius get topLarge => BorderRadius.only(
      topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r));
  BorderRadius get bottomLarge => BorderRadius.only(
      bottomLeft: Radius.circular(16.r), bottomRight: Radius.circular(16.r));
}

extension EdgeInsetsExtensions on EdgeInsets {
  EdgeInsets get allSmall => EdgeInsets.all(8.r);
  EdgeInsets get allMedium => EdgeInsets.all(12.r);
  EdgeInsets get allLarge => EdgeInsets.all(16.r);

  EdgeInsets get horizontalSmall => const EdgeInsets.symmetric(horizontal: 8);
  EdgeInsets get horizontalMedium => const EdgeInsets.symmetric(horizontal: 12);
  EdgeInsets get horizontalLarge => const EdgeInsets.symmetric(horizontal: 16);

  EdgeInsets get verticalSmall => const EdgeInsets.symmetric(vertical: 8);
  EdgeInsets get verticalMedium => const EdgeInsets.symmetric(vertical: 12);
  EdgeInsets get verticalLarge => const EdgeInsets.symmetric(vertical: 16);

  EdgeInsets get topSmall => const EdgeInsets.only(top: 8);
  EdgeInsets get topMedium => const EdgeInsets.only(top: 12);
  EdgeInsets get topLarge => const EdgeInsets.only(top: 16);

  EdgeInsets get bottomSmall => const EdgeInsets.only(bottom: 8);
  EdgeInsets get bottomMedium => const EdgeInsets.only(bottom: 12);
  EdgeInsets get bottomLarge => const EdgeInsets.only(bottom: 16);

  EdgeInsets get leftSmall => const EdgeInsets.only(left: 8);
  EdgeInsets get leftMedium => const EdgeInsets.only(left: 12);
  EdgeInsets get leftLarge => const EdgeInsets.only(left: 16);

  EdgeInsets get rightSmall => const EdgeInsets.only(right: 8);
  EdgeInsets get rightMedium => const EdgeInsets.only(right: 12);
  EdgeInsets get rightLarge => const EdgeInsets.only(right: 16);
}

extension ShadowStyle on List<BoxShadow> {
  List<BoxShadow> get small => const [
        BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 4)
      ];
  List<BoxShadow> get softCard => [
        BoxShadow(
            color: const Color(0xff000000).withOpacity(0.05),
            offset: const Offset(10, 10),
            blurRadius: 25)
      ];
  List<BoxShadow> get medium => [
        BoxShadow(
            color: const Color(0xff000000).withOpacity(0.05),
            offset: const Offset(0, 4),
            blurRadius: 12)
      ];

  List<BoxShadow> get top => [
        BoxShadow(
            color: const Color(0xff3F40E1).withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 15)
      ];
}
