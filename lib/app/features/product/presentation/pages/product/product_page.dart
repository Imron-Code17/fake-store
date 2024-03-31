import 'package:fakestore/app/config/theme/colors.dart';
import 'package:fakestore/app/features/product/presentation/bloc/product_bloc.dart';
import 'package:fakestore/app/features/product/presentation/pages/product/section/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'section/app_bar.dart';
import 'section/category.dart';
import 'section/header.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductBloc? productBloc;

  @override
  void initState() {
    super.initState();
    productBloc = BlocProvider.of<ProductBloc>(context);

    productBloc?.add(GetCategoriesEvent());
    productBloc?.add(GetProductsEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarProduct(),
      body: BlocListener<ProductBloc, ProductState>(
        listener: (context, state) {},
        child: RefreshIndicator(
          color: kPrimaryColor,
          onRefresh: () async {
            productBloc?.add(GetCategoriesEvent());
            productBloc?.add(GetProductsEvent());
          },
          child: const CustomScrollView(
            slivers: [HeaderSection(), CategorySection(), ProductSection()],
          ),
        ),
      ),
    );
  }
}
