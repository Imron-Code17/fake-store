import 'package:fakestore/app/features/product/presentation/utils/typedef.dart';

import '../../../presentation/utils/models/cart_product_body.dart';

abstract class ProductLocalDataSources {
  Future<void> addToCart(CartBody body);
  Future<void> addToFavorite(ProductId productId);
  Future<void> removeFromFavorite(ProductId productId);
  Future<FavoriteProduct> isFavorite(ProductId productId);
}
