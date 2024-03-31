import 'package:fakestore/app/config/theme/colors.dart';
import 'package:fakestore/app/config/theme/font.dart';
import 'package:fakestore/app/config/theme/style.dart';
import 'package:fakestore/app/config/theme/theme.dart';
import 'package:fakestore/app/core/components/form/app_form.dart';
import 'package:fakestore/app/core/utils/extension/context.dart';
import 'package:fakestore/app/features/product/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/components/card/card_border.dart';
import '../../../../../core/components/card/card_image.dart';
import '../../../../../routes/pages.dart';
import 'app_bar.dart';

class SeachProductPage extends StatefulWidget {
  const SeachProductPage({super.key});

  @override
  State<SeachProductPage> createState() => _SeachProductPageState();
}

class _SeachProductPageState extends State<SeachProductPage> {
  late TextEditingController searchController;

  ProductBloc? productBloc;
  bool isSearch = false;

  @override
  void initState() {
    super.initState();
    productBloc = BlocProvider.of<ProductBloc>(context);
    searchController = TextEditingController();
    searchController.addListener(searchListener);
  }

  @override
  void dispose() {
    productBloc?.add(ResetFilterProductEvent());
    searchController.removeListener(searchListener);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarSearchProduct(),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return ListView(
            padding: theme.style.padding.allLarge,
            children: [
              AppForm.search(controller: searchController),
              Gap(16.h),
              Visibility(
                  visible: isSearch,
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final item = state.filteredProducts?[index];
                        return GestureDetector(
                            onTap: () => context.to(Pages.detailProduct,
                                arguments: item?.id),
                            child: CardBorder(
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  CardImage.rectangle(
                                    size: theme.style.fullHeight / 7.2,
                                    image: item?.image ?? '',
                                  ),
                                  Gap(16.w),
                                  Expanded(
                                      child: SizedBox(
                                    height: theme.style.fullHeight / 7.6,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(item?.title ?? '',
                                                    style:
                                                        theme.font.f14.semibold,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                                Gap(4.h),
                                                Text("USD ${item?.price}",
                                                    style: theme
                                                        .font.f12.semibold),
                                              ],
                                            ),
                                          ),
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
                                                style: theme.font.f12
                                                    .copyWith(color: kSoftGrey),
                                              ),
                                            ],
                                          )
                                        ]),
                                  )),
                                ])));
                      },
                      separatorBuilder: (_, i) => Gap(12.h),
                      itemCount: state.filteredProducts?.length ?? 0))
            ],
          );
        },
      ),
    );
  }

  searchListener() {
    String searchValue = searchController.text;
    if (searchValue.isEmpty) {
      setState(() => isSearch = false);
    } else {
      productBloc?.add(FilterProductEvent(query: searchValue));
      setState(() => isSearch = true);
    }
  }
}
