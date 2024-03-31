import 'package:fakestore/app/config/theme/colors.dart';
import 'package:fakestore/app/config/theme/font.dart';
import 'package:fakestore/app/config/theme/theme.dart';
import 'package:fakestore/app/core/utils/extension/first_capital.dart';
import 'package:fakestore/app/features/product/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.categoryStatus == CategoryStatus.loading) {
            return SizedBox(
              child: Center(
                child: SizedBox(
                  height: 30.r,
                  width: 30.r,
                  child: const CircularProgressIndicator(
                    color: kPrimaryColor,
                    strokeWidth: 1.4,
                  ),
                ),
              ),
            );
          }
          return SizedBox(
            height: 36.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Padding(
                      padding: EdgeInsets.only(
                          left: index == 0 ? 16.w : 0,
                          right: index == (state.categories?.length ?? 0) - 1
                              ? 16.w
                              : 0),
                      child: ChoiceChip(
                        onSelected: (value) {
                          context.read<ProductBloc>().add(
                              GetProductByCategoryEvent(
                                  category: state.categories?[index] ?? ''));
                        },
                        showCheckmark: false,
                        selectedColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.r),
                            side: const BorderSide(color: Colors.transparent)),
                        clipBehavior: Clip.none,
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.categories?[index].capitalizeFirstLetter ??
                                  '',
                              style: theme.font.f14.medium.copyWith(
                                  color: state.selectedCategory ==
                                          state.categories?[index]
                                      ? kWhiteColor
                                      : kSoftGrey),
                            ),
                          ],
                        ),
                        selected:
                            state.selectedCategory == state.categories?[index],
                      ));
                },
                separatorBuilder: (_, i) => Gap(4.w),
                itemCount: state.categories?.length ?? 0),
          );
        },
      ),
    );
  }
}
