import 'package:fakestore/app/config/theme/colors.dart';
import 'package:fakestore/app/config/theme/font.dart';
import 'package:fakestore/app/config/theme/theme.dart';
import 'package:fakestore/app/core/utils/extension/context.dart';
import 'package:fakestore/app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../injection_containers.dart';
import '../../../../../../routes/pages.dart';

class AppBarDetailProduct extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarDetailProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      bloc: sl()..add(GetCartProductsEvent()),
      builder: (context, state) {
        final totalProductOnCart = state.cartProducts?.length ?? 0;
        return AppBar(
          backgroundColor: kWhiteColor,
          leading: GestureDetector(
            child: Icon(
              Icons.chevron_left_rounded,
              color: kBlackColor,
              size: 36.r,
            ),
            onTap: () {
              context.pop();
            },
          ),
          actions: [
            GestureDetector(
              child: Badge.count(
                  isLabelVisible: totalProductOnCart > 0,
                  backgroundColor: kErrorColor,
                  textStyle: theme.font.f10.white.semibold,
                  count: totalProductOnCart,
                  child: const Icon(Icons.shopping_cart_outlined,
                      color: kBlackColor)),
              onTap: () {
                context.to(Pages.cart);
              },
            ),
            Gap(16.w)
          ],
          centerTitle: true,
          automaticallyImplyLeading: false,
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
