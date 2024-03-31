import 'package:fakestore/app/features/product/presentation/utils/models/cart_product_body.dart';
import 'package:fakestore/app/features/product/presentation/utils/typedef.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/error_imports.dart';

abstract class ProductRepositories {
  Future<Either<RemoteFailure, Categories>> getCategories();
  Future<Either<RemoteFailure, Products>> getProducts();
  Future<Either<RemoteFailure, Products>> getProductByCategory(
      CategoryName category);
  Future<Either<RemoteFailure, Product>> getProductDetail(ProductId id);

  // local
  Future<void> addToCart(CartBody body);
  Future<void> addFavoriteProduct(ProductId id);
  Future<void> removeProductFromCart(ProductId id);
  Future<FavoriteProduct> isFavoriteProduct(ProductId id);
}
