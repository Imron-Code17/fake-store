import 'package:fakestore/app/features/product/data/data_sources/local/product_local_data_sources.dart';
import 'package:fakestore/app/features/product/domain/entities/product_entity.dart';
import 'package:fakestore/app/features/product/presentation/utils/models/cart_product_body.dart';
import 'package:fakestore/app/features/product/presentation/utils/typedef.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/error_imports.dart';
import '../../domain/repositories/product_repositories.dart';
import '../data_sources/remote/product_remote_data_sources.dart';

class ProductRepositoriesImpl implements ProductRepositories {
  final ProductRemoteDataSources _productRemoteDataSources;
  final ProductLocalDataSources _productLocalDataSources;
  ProductRepositoriesImpl(
      this._productRemoteDataSources, this._productLocalDataSources);

  @override
  Future<Either<RemoteFailure, Categories>> getCategories() async {
    try {
      final data = await _productRemoteDataSources.getCategories();
      return Right(data);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, Products>> getProducts() async {
    try {
      final data = await _productRemoteDataSources.getProducts();
      final response = data.map((e) => ProductEntity.fromModel(e)).toList();
      return Right(response);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, Products>> getProductByCategory(
      CategoryName category) async {
    try {
      final data =
          await _productRemoteDataSources.getProductByCategory(category);
      final response = data.map((e) => ProductEntity.fromModel(e)).toList();
      return Right(response);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<Either<RemoteFailure, Product>> getProductDetail(ProductId id) async {
    try {
      final data = await _productRemoteDataSources.getProductDetail(id);
      final response = ProductEntity.fromModel(data);
      return Right(response);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }

  @override
  Future<void> addToCart(CartBody body) async {
    try {
      await _productLocalDataSources.addToCart(body);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<FavoriteProduct> isFavoriteProduct(ProductId productId) async {
    try {
      final data = await _productLocalDataSources.isFavorite(productId);
      return data;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> addFavoriteProduct(ProductId id) async {
    try {
      await _productLocalDataSources.addToFavorite(id);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> removeProductFromCart(ProductId id) async {
    try {
      await _productLocalDataSources.removeFromFavorite(id);
    } catch (e) {
      throw Exception(e);
    }
  }
}
