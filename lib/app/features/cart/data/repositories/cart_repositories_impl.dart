import '../../domain/repositories/cart_repositories.dart';
import '../../presentation/utils/models/cart_params.dart';
import '../../presentation/utils/typedef.dart';
import '../data_sources/local/cart_local_data_sources.dart';

class CartRepositoriesImpl implements CartRepositories {
  final CartLocalDataSources _cartLocalDataSources;
  CartRepositoriesImpl(this._cartLocalDataSources);

  // Future<CartProducts> getCartProducts();
  // Future<void> addQuantity(ProductId productId, ProductQuantity quantity);
  // Future<void> removeQuantity(ProductId productId, ProductQuantity quantity);
  // Future<void> deleteProduct(ProductId productId);

  @override
  Future<CartProducts> getCartProducts() async {
    try {
      return await _cartLocalDataSources.getCart();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> addQuantity(CartParams params) async {
    try {
      await _cartLocalDataSources.addQuantity(params);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> removeQuantity(CartParams params) async {
    try {
      await _cartLocalDataSources.removeQuantity(params);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteProduct(CartParams params) async {
    try {
      await _cartLocalDataSources.deleteProduct(params);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteAllProduct() async {
    try {
      await _cartLocalDataSources.deleteAllProduct();
    } catch (e) {
      throw Exception(e);
    }
  }
}
