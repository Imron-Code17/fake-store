import 'package:fakestore/app/features/cart/presentation/utils/typedef.dart';

import '../../../../../core/network/local_data_sources_impl.dart';
import '../../../../../core/network/request_local.dart';
import '../../../presentation/utils/models/cart_params.dart';
import 'cart_local_data_sources.dart';

class CartLocalDataSourcesImpl extends LocalDataSourceImpl
    implements CartLocalDataSources {
  CartLocalDataSourcesImpl(super.client);

  @override
  Future<CartProducts> getCart() async {
    return await storage(() => getCartProducts());
  }

  @override
  Future<void> addQuantity(CartParams params) async {
    return await storage(() =>
        updateQuantity(params.productId ?? 0, (params.quantity ?? 0) + 1));
  }

  @override
  Future<void> removeQuantity(CartParams params) async {
    return await storage(() =>
        updateQuantity(params.productId ?? 0, (params.quantity ?? 0) - 1));
  }

  @override
  Future<void> deleteProduct(CartParams params) async {
    return await storage(() => deleteCartProducts(params.productId ?? 0));
  }

  @override
  Future<void> deleteAllProduct() async {
    return await storage(() => deleteAllCartProducts());
  }
}
