import 'package:fakestore/app/core/utils/app_storage/app_storage.dart';
import 'package:fakestore/app/features/product/presentation/utils/typedef.dart';
import '../../features/cart/presentation/utils/typedef.dart' as c;
import '../../features/product/presentation/utils/models/cart_product_body.dart';

abstract class LocalDataSourceImpl {
  final AppStorage _storage;
  LocalDataSourceImpl(this._storage);

  Future<void> saveFavoriteProduct(ProductId productId) async {
    return _storage.saveFavorite(id: productId);
  }

  Future<void> deleteFavoriteProduct(ProductId productId) async {
    return _storage.removeFavorite(id: productId);
  }

  Future<bool> isFavoriteProduct(ProductId productId) async {
    return _storage.isFavorite(id: productId);
  }

  Future<c.CartProducts> getCartProducts() async {
    return _storage.getCartProducts();
  }

  Future<void> saveCartProducts(CartBody cartProducts) async {
    return _storage.saveCartProduct(data: cartProducts);
  }

  Future<void> deleteCartProducts(c.ProductId productId) async {
    return _storage.deleteCartProduct(id: productId);
  }

  Future<void> deleteAllCartProducts() async {
    return _storage.deleteAllCartProduct();
  }

  Future<void> updateQuantity(
      c.ProductId productId, c.ProductQuantity quantity) async {
    return _storage.updateQuantity(id: productId, newQuantity: quantity);
  }
}
