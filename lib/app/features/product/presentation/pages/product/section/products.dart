import 'package:fakestore/app/config/theme/colors.dart';
import 'package:fakestore/app/config/theme/font.dart';
import 'package:fakestore/app/config/theme/style.dart';
import 'package:fakestore/app/config/theme/theme.dart';
import 'package:fakestore/app/core/components/card/card_border.dart';
import 'package:fakestore/app/core/components/card/card_image.dart';
import 'package:fakestore/app/core/utils/extension/context.dart';
import 'package:fakestore/app/core/utils/extension/convert_price.dart';
import 'package:fakestore/app/features/product/presentation/bloc/product_bloc.dart';
import 'package:fakestore/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state.productStatus == ProductStatus.loading) {
          return SliverToBoxAdapter(
              child: SizedBox(
            height: theme.style.fullHeight / 1.6,
            width: theme.style.fullWidth / 1.6,
            child: const Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
                strokeWidth: 1.4,
              ),
            ),
          ));
        } else {
          return SliverPadding(
              padding: theme.style.padding.allLarge,
              sliver: SliverToBoxAdapter(
                child: StaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12.r,
                    crossAxisSpacing: 12.r,
                    children:
                        List.generate(state.products?.length ?? 0, (index) {
                      final item = state.products?[index];
                      return GestureDetector(
                        onTap: () => context.to(Pages.detailProduct,
                            arguments: item?.id),
                        child: CardBorder(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CardImage.rectangle(
                              size: theme.style.fullWidth / 2.4,
                              image: item?.image ?? '',
                            ),
                            Gap(12.h),
                            Text(
                              item?.title ?? '',
                              style: theme.font.f14.semibold,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Gap(8.h),
                            Text(
                              "USD ${'${item?.price}'.convertPrice}",
                              style: theme.font.f14.semibold,
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
                                  "${item?.rating?.rate}",
                                  style: theme.font.f12,
                                ),
                                Gap(8.w),
                                Text(
                                  "${item?.rating?.count} Review",
                                  style:
                                      theme.font.f12.copyWith(color: kSoftGrey),
                                ),
                              ],
                            )
                          ],
                        )),
                      );
                    })),
              ));
        }
      },
    );
  }
}
