import 'package:extended_image/extended_image.dart';
import 'package:fakestore/app/config/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/theme/colors.dart';
import '../../../config/theme/theme.dart';

class CardImage extends StatelessWidget {
  const CardImage.circle({
    Key? key,
    required this.image,
    this.size = 26,
    this.isCircle = true,
  }) : super(key: key);

  const CardImage.rectangle({
    Key? key,
    required this.image,
    this.size = 26,
    this.isCircle = false,
  }) : super(key: key);

  final String image;
  final double size;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.r,
      height: size.r,
      child: ExtendedImage.network(
        image,
        handleLoadingProgress: true,
        clearMemoryCacheIfFailed: true,
        clearMemoryCacheWhenDispose: true,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        cache: false,
        fit: isCircle ? BoxFit.cover : BoxFit.contain,
        loadStateChanged: (state) {
          if (state.extendedImageLoadState == LoadState.loading) {
            return CircleAvatar(
              radius: (size / 2.4).r,
              backgroundColor: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(
                  color: kPrimaryAccentColor,
                  strokeWidth: 1.4,
                ),
              ),
            );
          } else if (state.extendedImageLoadState == LoadState.failed) {
            return isCircle ? _circleError : _rectangleError;
          }
          return null;
        },
      ),
    );
  }

  Widget get _circleError {
    return CircleAvatar(
      radius: size.r,
      backgroundColor: kErrorColor.withOpacity(0.2),
      child: Center(
        child: Icon(
          Icons.error,
          color: kErrorColor,
          size: (size - 6).r,
        ),
      ),
    );
  }

  Widget get _rectangleError {
    return Container(
      width: size.r,
      height: size.r,
      decoration: BoxDecoration(
        color: kErrorColor.withOpacity(0.2),
        borderRadius: theme.style.borderRadius.allSmall,
      ),
      child: Center(
        child: Icon(
          Icons.error,
          color: kErrorColor,
          size: (size - 12).r,
        ),
      ),
    );
  }
}
