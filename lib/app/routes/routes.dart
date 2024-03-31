import 'package:fakestore/app/features/auth/presentation/pages/login/login_page.dart';
import 'package:fakestore/app/features/cart/presentation/pages/cart/cart_page.dart';
import 'package:fakestore/app/features/product/presentation/pages/detail_product/detail_product.dart';
import 'package:fakestore/app/features/product/presentation/pages/product/product_page.dart';
import 'package:flutter/material.dart';

import '../features/product/presentation/pages/search_product/search_product.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/product':
        return _materialRoute(const ProductPage());
      case '/login':
        return _materialRoute(const LoginPage());
      case '/detail-product':
        return _materialRoute(
            DetailProductPage(productId: settings.arguments as int));
      case '/cart':
        return _materialRoute(const CartPage());
      case '/search-product':
        return _materialRoute(const SeachProductPage());
      default:
        return _materialRoute(const LoginPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
