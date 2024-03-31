import 'package:fakestore/app/config/theme/font.dart';
import 'package:fakestore/app/config/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../config/theme/colors.dart';
import '../../../config/theme/theme.dart';
import '../../constant/constant.dart';

enum SnackType { success, error, dark }

class AppSnackbar {
  static void show({
    String? message,
    SnackType type = SnackType.success,
    bool onTop = false,
  }) {
    SnackBar snackBar = SnackBar(
      backgroundColor: type == SnackType.success
          ? kSuccessColor
          : type == SnackType.dark
              ? kBlackColor.withOpacity(0.8)
              : kErrorColor,
      content: Row(
        children: [
          if (type != SnackType.dark)
            Icon(
              type == SnackType.success
                  ? Icons.check_circle_rounded
                  : Icons.close,
              color: Colors.white,
              size: 18.r,
            ),
          Gap(8.w),
          Expanded(
            child: Text(
              message == null || message == "" ? "Error not defined" : message,
              style: theme.font.f12.white,
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 2),
      shape: RoundedRectangleBorder(
        borderRadius: theme.style.borderRadius.allSmall,
      ),
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
  }
}
