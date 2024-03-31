import 'package:fakestore/app/features/cart/presentation/utils/typedef.dart';

import '../../presentation/utils/models/cart_params.dart';

abstract class CartRepositories {
  Future<CartProducts> getCartProducts();
  Future<void> addQuantity(CartParams params);
  Future<void> removeQuantity(CartParams params);
  Future<void> deleteProduct(CartParams params);
  Future<void> deleteAllProduct();
}
