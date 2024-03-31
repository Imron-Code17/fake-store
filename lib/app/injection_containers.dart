import 'package:fakestore/app/core/utils/app_storage/app_storage.dart';
import 'package:fakestore/app/features/auth/data/data_sources/auth_data_sources.dart';
import 'package:fakestore/app/features/auth/domain/usecase/todo_login.dart';
import 'package:fakestore/app/features/cart/domain/usecase/add_quantity_product.dart';
import 'package:fakestore/app/features/cart/domain/usecase/delete_cart_product.dart';
import 'package:fakestore/app/features/cart/domain/usecase/remove_quantity_product.dart';
import 'package:fakestore/app/features/product/domain/usecase/add_favorite_product.dart';
import 'package:fakestore/app/features/product/domain/usecase/add_to_cart.dart';
import 'package:fakestore/app/features/product/domain/usecase/check_favorite_product.dart';
import 'package:fakestore/app/features/product/domain/usecase/get_categories.dart';
import 'package:fakestore/app/features/product/domain/usecase/get_product_by_category.dart';
import 'package:fakestore/app/features/product/domain/usecase/get_product_detail.dart';
import 'package:fakestore/app/features/product/domain/usecase/get_products.dart';
import 'package:fakestore/app/features/product/domain/usecase/remove_favorite_product.dart';
import 'package:get_it/get_it.dart';
import 'core/network/dio_client.dart';
import 'features/auth/data/data_sources/auth_data_sources_impl.dart';
import 'features/auth/data/repositories/auth_repositories_impl.dart';
import 'features/auth/domain/repositories/auth_repositories.dart';
import 'features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'features/cart/data/data_sources/local/cart_local_data_sources.dart';
import 'features/cart/data/data_sources/local/cart_local_data_sources_impl.dart';
import 'features/cart/data/repositories/cart_repositories_impl.dart';
import 'features/cart/domain/repositories/cart_repositories.dart';
import 'features/cart/domain/usecase/delete_all_cart_product.dart';
import 'features/cart/domain/usecase/get_cart_product.dart';
import 'features/cart/presentation/bloc/cart_bloc.dart';
import 'features/product/data/data_sources/local/product_local_data_sources.dart';
import 'features/product/data/data_sources/local/product_local_data_sources_impl.dart';
import 'features/product/data/data_sources/remote/product_remote_data_sources.dart';
import 'features/product/data/data_sources/remote/product_remote_data_sources_impl.dart';
import 'features/product/data/repositories/product_repositories_impl.dart';
import 'features/product/domain/repositories/product_repositories.dart';
import 'features/product/presentation/bloc/product_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDepedencies() async {
  // Network
  sl.registerSingleton<DioClient>(DioClient());
  // Local Data Source
  sl.registerSingleton<ProductLocalDataSources>(
      ProductLocalDataSourcesImpl(AppStorage()));
  sl.registerSingleton<CartLocalDataSources>(
      CartLocalDataSourcesImpl(AppStorage()));
  // Remote Data Source
  sl.registerSingleton<AuthRemoteDataSources>(
      AuthRemoteDataSourcesImpl(DioClient()));
  sl.registerSingleton<AuthRepositories>(AuthRepositoriesImpl(sl()));
  sl.registerSingleton<ProductRemoteDataSources>(
      ProductRemoteDataSourcesImpl(DioClient()));
  sl.registerSingleton<ProductRepositories>(
      ProductRepositoriesImpl(sl(), sl()));
  sl.registerSingleton<CartRepositories>(CartRepositoriesImpl(sl()));

  // Auth Bloc
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));
  // Auth UseCase
  sl.registerFactory<TodoLoginUseCase>(() => TodoLoginUseCase(sl()));

  // Product Bloc
  sl.registerFactory<ProductBloc>(
      () => ProductBloc(sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()));
  // Product UseCase
  sl.registerFactory<GetCategories>(() => GetCategories(sl()));
  sl.registerFactory<GetProducts>(() => GetProducts(sl()));
  sl.registerFactory<GetProductsByCategory>(() => GetProductsByCategory(sl()));
  sl.registerFactory<GetProductsDetail>(() => GetProductsDetail(sl()));
  sl.registerFactory<AddFavoriteProduct>(() => AddFavoriteProduct(sl()));
  sl.registerFactory<RemoveFavoriteProduct>(() => RemoveFavoriteProduct(sl()));
  sl.registerFactory<CheckFavoriteProducts>(() => CheckFavoriteProducts(sl()));
  sl.registerFactory<AddToCartProduct>(() => AddToCartProduct(sl()));

  // Cart Bloc
  sl.registerFactory<CartBloc>(() => CartBloc(sl(), sl(), sl(), sl(), sl()));
  // Cart Use Case
  sl.registerFactory<AddQtyCartProduct>(() => AddQtyCartProduct(sl()));
  sl.registerFactory<RemoveQtyCartProduct>(() => RemoveQtyCartProduct(sl()));
  sl.registerFactory<GetCartProduct>(() => GetCartProduct(sl()));
  sl.registerFactory<DeleteCartProducts>(() => DeleteCartProducts(sl()));
  sl.registerFactory<DeleteAllCartProducts>(() => DeleteAllCartProducts(sl()));
}
