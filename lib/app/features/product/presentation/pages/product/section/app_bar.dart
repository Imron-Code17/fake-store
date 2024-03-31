import 'package:fakestore/app/config/theme/colors.dart';
import 'package:fakestore/app/config/theme/font.dart';
import 'package:fakestore/app/config/theme/theme.dart';
import 'package:fakestore/app/core/components/card/card_image.dart';
import 'package:fakestore/app/core/utils/extension/context.dart';
import 'package:fakestore/app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:fakestore/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../injection_containers.dart';

class AppBarProduct extends StatelessWidget implements PreferredSizeWidget {
  const AppBarProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kWhiteColor,
      title: Row(
        children: [
          const CardImage.circle(
            size: 28,
            image:
                'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
          const Spacer(),
          Text('Fake Store', style: theme.font.f16.semibold.primary),
          const Spacer(),
          GestureDetector(
            child: const Icon(Icons.search, color: kBlackColor),
            onTap: () {
              context.to(Pages.searchProduct);
            },
          ),
          Gap(12.w),
          GestureDetector(
            child: const Icon(Icons.shopping_cart_outlined, color: kBlackColor),
            onTap: () {
              context.to(Pages.cart);
            },
          ),
        ],
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
