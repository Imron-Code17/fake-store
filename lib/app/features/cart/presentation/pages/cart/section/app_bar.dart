import 'package:fakestore/app/config/theme/colors.dart';
import 'package:fakestore/app/config/theme/font.dart';
import 'package:fakestore/app/config/theme/theme.dart';
import 'package:fakestore/app/core/utils/extension/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../bloc/cart_bloc.dart';

class AppBarCartProduct extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCartProduct({super.key});

  @override
  Widget build(BuildContext context) {
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
      title: Text('Shopping Cart', style: theme.font.f18.semibold),
      actions: [
        GestureDetector(
          child: const Icon(Icons.delete_outline_rounded, color: kBlackColor),
          onTap: () {
            context.read<CartBloc>().add(DeleteAllCartProductEvent());
          },
        ),
        Gap(16.w)
      ],
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
