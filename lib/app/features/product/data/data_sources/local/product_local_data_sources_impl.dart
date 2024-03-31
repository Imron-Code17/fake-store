import 'package:fakestore/app/core/network/request_local.dart';
import '../../../../../core/network/local_data_sources_impl.dart';
import '../../../presentation/utils/models/cart_product_body.dart';
import '../../../presentation/utils/typedef.dart';
import 'product_local_data_sources.dart';

class ProductLocalDataSourcesImpl extends LocalDataSourceImpl
    implements ProductLocalDataSources {
  ProductLocalDataSourcesImpl(super.client);

  @override
  Future<void> addToCart(CartBody body) async {
    await storage(() => saveCartProducts(body));
  }

  @override
  Future<void> addToFavorite(ProductId productId) async {
    await storage(() => saveFavoriteProduct(productId));
  }

  @override
  Future<void> removeFromFavorite(ProductId productId) async {
    await storage(() => deleteFavoriteProduct(productId));
  }

  @override
  Future<FavoriteProduct> isFavorite(ProductId productId) async {
    return await storage(() => isFavoriteProduct(productId));
  }
}
