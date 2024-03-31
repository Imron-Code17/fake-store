import 'package:fakestore/app/config/theme/colors.dart';
import 'package:fakestore/app/config/theme/font.dart';
import 'package:fakestore/app/config/theme/style.dart';
import 'package:fakestore/app/config/theme/theme.dart';
import 'package:fakestore/app/core/components/button/primary_button.dart';
import 'package:fakestore/app/core/components/card/card_border.dart';
import 'package:fakestore/app/core/components/card/card_image.dart';
import 'package:fakestore/app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'section/app_bar.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartBloc? cartBloc;

  @override
  void initState() {
    super.initState();
    cartBloc = BlocProvider.of<CartBloc>(context);
    cartBloc?.add(GetCartProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const AppBarCartProduct(),
          body: ListView.separated(
              padding: theme.style.padding.allLarge,
              itemBuilder: (_, index) {
                final productId = state.cartProducts?[index].id;
                final qty = state.cartProducts?[index].qty;

                return CardBorder(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      CardImage.rectangle(
                        size: theme.style.fullHeight / 8.2,
                        image: state.cartProducts?[index].image ?? '',
                      ),
                      Gap(16.w),
                      Expanded(
                          child: SizedBox(
                        height: theme.style.fullHeight / 8.6,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(state.cartProducts?[index].title ?? '',
                                        style: theme.font.f14.semibold,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis),
                                    Gap(4.h),
                                    Text(
                                        "USD ${state.cartProducts?[index].price}",
                                        style: theme.font.f12.semibold),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if ((qty ?? 0) > 1) {
                                        context.read<CartBloc>().add(
                                            RemoveQuantityEvent(
                                                productId: productId ?? 0,
                                                quantity: qty ?? 0));
                                      } else {
                                        context.read<CartBloc>().add(
                                            DeleteCartProductEvent(
                                                productId: productId ?? 0));
                                      }
                                    },
                                    child: Container(
                                      height: 24.r,
                                      width: 24.r,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          border: Border.all(color: kGrey),
                                          color: kWhiteColor),
                                      child: Center(
                                          child: Icon(Icons.remove,
                                              color: kBlackColor, size: 16.r)),
                                    ),
                                  ),
                                  Gap(8.w),
                                  SizedBox(
                                    height: 24.r,
                                    width: 24.r,
                                    child: Center(
                                        child: Text(
                                            "${state.cartProducts?[index].qty}",
                                            style: theme.font.f12.black)),
                                  ),
                                  Gap(8.w),
                                  GestureDetector(
                                    onTap: () {
                                      context.read<CartBloc>().add(
                                          AddQuantityEvent(
                                              productId: productId ?? 0,
                                              quantity: qty ?? 0));
                                    },
                                    child: Container(
                                      height: 24.r,
                                      width: 24.r,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          border: Border.all(color: kGrey),
                                          color: kWhiteColor),
                                      child: Center(
                                          child: Icon(Icons.add,
                                              color: kBlackColor, size: 16.r)),
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    child: Icon(Icons.delete_outline_rounded,
                                        color: kGrey),
                                    onTap: () {
                                      context.read<CartBloc>().add(
                                          DeleteCartProductEvent(
                                              productId: productId ?? 0));
                                    },
                                  ),
                                ],
                              )
                            ]),
                      )),
                    ]));
              },
              separatorBuilder: (_, i) => Gap(12.h),
              itemCount: state.cartProducts?.length ?? 0),
          bottomNavigationBar: Container(
            height: 112.h,
            color: kWhiteColor,
            padding: theme.style.padding.allLarge,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total ${state.item} Item',
                          style:
                              theme.font.f12.semibold.copyWith(color: kGrey)),
                      Text("USD ${state.amount?.toStringAsFixed(2)}",
                          style: theme.font.f14.semibold)
                    ]),
                Gap(12.h),
                PrimaryButton(
                  isExpanded: true,
                  text: 'Checkout',
                  onPressed: () {},
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
