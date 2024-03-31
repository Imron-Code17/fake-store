import 'package:fakestore/app/config/theme/font.dart';
import 'package:fakestore/app/config/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme/colors.dart';
import '../../../config/theme/theme.dart';
import '../../utils/screen_size.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      this.text,
      this.isExpanded = false,
      this.isLoading = false,
      this.scale,
      this.onPressed});

  final String? text;
  final bool isExpanded;
  final bool isLoading;
  final double? scale;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      width: scale != null
          ? getWidthScale(scale ?? 1)
          : isExpanded
              ? theme.style.fullWidth
              : null,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: theme.style.borderRadius.allSmall,
              )),
          onPressed: onPressed,
          child: isLoading
              ? onLoadingWidget
              : Text(text ?? "Button",
                  style: theme.font.f14.white.semibold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis)),
    );
  }

  Widget get onLoadingWidget {
    return Center(
        child: SizedBox(
            height: 24.r,
            width: 24.r,
            child: const CircularProgressIndicator(
                strokeWidth: 2, color: kWhiteColor)));
  }
}
