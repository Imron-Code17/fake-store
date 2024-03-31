import 'package:fakestore/app/config/theme/colors.dart';
import 'package:fakestore/app/config/theme/font.dart';
import 'package:fakestore/app/config/theme/style.dart';
import 'package:fakestore/app/config/theme/theme.dart';
import 'package:fakestore/app/core/components/button/primary_button.dart';
import 'package:fakestore/app/core/components/card/card_image.dart';
import 'package:fakestore/app/features/product/presentation/bloc/product_bloc.dart';
import 'package:fakestore/app/features/product/presentation/pages/detail_product/section/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../utils/typedef.dart';

class DetailProductPage extends StatefulWidget {
  const DetailProductPage({super.key, required this.productId});

  final ProductId productId;

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  ProductBloc? productBloc;

  @override
  void initState() {
    super.initState();
    productBloc = BlocProvider.of<ProductBloc>(context);
    productBloc?.add(GetDetailProductEvent(productId: widget.productId));
    productBloc?.add(CheckFavoriteProductEvent(productId: widget.productId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        bool isFavorite = state.favoriteProduct == true;
        if (state.detailProductStatus == DetailProductStatus.loading) {
          return Material(
            color: kWhiteColor,
            child: SizedBox(
              height: theme.style.fullHeight,
              width: theme.style.fullWidth,
              child: const Center(
                child: CircularProgressIndicator(
                  color: kPrimaryAccentColor,
                  strokeWidth: 1.4,
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: const AppBarDetailProduct(),
            body: ListView(
              padding: theme.style.padding.allLarge,
              children: [
                SizedBox(
                  height: theme.style.fullHeight / 3,
                  child: Center(
                    child: CardImage.rectangle(
                      size: theme.style.fullHeight / 3,
                      image: state.detailProduct?.image ?? '',
                    ),
                  ),
                ),
                Gap(16.h),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "USD ${state.detailProduct?.price}",
                        style: theme.font.f16.primary.semibold,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (isFavorite) {
                            context.read<ProductBloc>().add(
                                RemoveFromFavoriteProductEvent(
                                    productId: widget.productId));
                          } else {
                            context.read<ProductBloc>().add(
                                AddToFavoriteProductEvent(
                                    productId: widget.productId));
                          }
                        },
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: kPrimaryColor,
                        ),
                      )
                    ]),
                Gap(12.h),
                Text(
                  state.detailProduct?.title ?? '',
                  style: theme.font.f18.semibold,
                ),
                Gap(8.h),
                Row(
                  children: [
                    Icon(
                      Icons.star_rate_rounded,
                      color: kWarningColor,
                      size: 18.r,
                    ),
                    Gap(4.w),
                    Text(
                      "${state.detailProduct?.rating?.rate}",
                      style: theme.font.f12,
                    ),
                    Gap(8.w),
                    Text(
                      "${state.detailProduct?.rating?.count} Review",
                      style: theme.font.f12.copyWith(color: kSoftGrey),
                    ),
                  ],
                ),
                Gap(16.h),
                Text(state.detailProduct?.description ?? '',
                    style: theme.font.f14)
              ],
            ),
            bottomNavigationBar: Container(
              height: 72.h,
              padding: theme.style.padding.allLarge,
              color: kWhiteColor,
              child: PrimaryButton(
                text: 'Add To Cart',
                onPressed: () {
                  context.read<ProductBloc>().add(
                      AddToCartProductEvent(product: state.detailProduct!));
                },
              ),
            ),
          );
        }
      },
    );
  }
}
