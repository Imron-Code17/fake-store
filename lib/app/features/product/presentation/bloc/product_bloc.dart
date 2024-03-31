import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fakestore/app/core/components/snackbar/app_snackbar.dart';
import 'package:fakestore/app/features/product/domain/usecase/add_favorite_product.dart';
import 'package:fakestore/app/features/product/domain/usecase/add_to_cart.dart';
import 'package:fakestore/app/features/product/domain/usecase/get_categories.dart';
import 'package:fakestore/app/features/product/domain/usecase/get_product_by_category.dart';
import 'package:fakestore/app/features/product/domain/usecase/get_product_detail.dart';
import 'package:fakestore/app/features/product/domain/usecase/get_products.dart';
import 'package:fakestore/app/features/product/presentation/utils/models/cart_product_body.dart';
import 'package:fakestore/app/features/product/presentation/utils/typedef.dart';

import '../../domain/usecase/check_favorite_product.dart';
import '../../domain/usecase/remove_favorite_product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetCategories _getCategories;
  final GetProducts _getProducts;
  final GetProductsByCategory _getProductsByCategory;
  final GetProductsDetail _getProductsDetail;
  final AddFavoriteProduct _addFavoriteProduct;
  final RemoveFavoriteProduct _removeFavoriteProduct;
  final CheckFavoriteProducts _checkFavoriteProduct;
  final AddToCartProduct _addToCartProduct;
  ProductBloc(
      this._getCategories,
      this._getProductsByCategory,
      this._getProducts,
      this._getProductsDetail,
      this._addFavoriteProduct,
      this._removeFavoriteProduct,
      this._checkFavoriteProduct,
      this._addToCartProduct)
      : super(ProductState.init()) {
    on<GetCategoriesEvent>(onGetCategories);
    on<GetProductsEvent>(onGetProducts);
    on<GetProductByCategoryEvent>(onGetProductsByCategory);
    on<GetDetailProductEvent>(onGetDetailProduct);
    on<AddToFavoriteProductEvent>(onAddToFavoriteProduct);
    on<RemoveFromFavoriteProductEvent>(onRemoveFromFavoriteProduct);
    on<CheckFavoriteProductEvent>(checkFavoriteProduct);
    on<AddToCartProductEvent>(onAddToCartProduct);
    on<FilterProductEvent>(onFilterProduct);
    on<ResetFilterProductEvent>(onResetProduct);
  }

  void onGetCategories(
      GetCategoriesEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(
      categoryStatus: CategoryStatus.loading,
    ));
    final result = await _getCategories();
    result.fold((error) {
      emit(state.copyWith(
        categoryStatus: CategoryStatus.failure,
      ));
      AppSnackbar.show(message: error.message, type: SnackType.error);
    }, (data) {
      emit(state.copyWith(
          categoryStatus: CategoryStatus.success,
          selectedCategory: 'All',
          categories: ['All', ...data]));
    });
  }

  void onGetProducts(GetProductsEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(productStatus: ProductStatus.loading));
    final result = await _getProducts();
    result.fold((error) {
      AppSnackbar.show(message: error.message, type: SnackType.error);
      emit(state.copyWith(
        productStatus: ProductStatus.failure,
      ));
    }, (data) {
      emit(
          state.copyWith(products: data, productStatus: ProductStatus.success));
    });
  }

  void onGetProductsByCategory(
      GetProductByCategoryEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(
        selectedCategory: event.category,
        selectCategory: true,
        productStatus: ProductStatus.loading));
    if (event.category != 'All') {
      final result = await _getProductsByCategory(event.category);
      result.fold((error) {
        AppSnackbar.show(message: error.message, type: SnackType.error);
        emit(state.copyWith(
          productStatus: ProductStatus.failure,
          selectCategory: true,
        ));
      }, (data) {
        emit(state.copyWith(
          products: data,
          productStatus: ProductStatus.success,
          selectCategory: true,
        ));
      });
    } else {
      final result = await _getProducts();
      result.fold((error) {
        AppSnackbar.show(message: error.message, type: SnackType.error);
        emit(state.copyWith(
          productStatus: ProductStatus.failure,
          selectCategory: true,
        ));
      }, (data) {
        emit(state.copyWith(
          products: data,
          productStatus: ProductStatus.success,
          selectCategory: true,
        ));
      });
    }
  }

  void onGetDetailProduct(
      GetDetailProductEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(
        detailProduct: null, detailProductStatus: DetailProductStatus.loading));
    final result = await _getProductsDetail(event.productId);
    result.fold((error) {
      AppSnackbar.show(message: error.message, type: SnackType.error);
      emit(state.copyWith(
          detailProduct: null,
          detailProductStatus: DetailProductStatus.failure));
    }, (data) {
      emit(state.copyWith(
          detailProduct: data,
          detailProductStatus: DetailProductStatus.success));
    });
  }

  void onAddToFavoriteProduct(
      AddToFavoriteProductEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(favoriteProduct: true));
    await _addFavoriteProduct(event.productId);
  }

  void onRemoveFromFavoriteProduct(
      RemoveFromFavoriteProductEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(favoriteProduct: false));
    await _removeFavoriteProduct(event.productId);
  }

  void checkFavoriteProduct(
      CheckFavoriteProductEvent event, Emitter<ProductState> emit) async {
    final isFavorite = await _checkFavoriteProduct(event.productId);
    emit(state.copyWith(favoriteProduct: isFavorite));
  }

  void onAddToCartProduct(
      AddToCartProductEvent event, Emitter<ProductState> emit) async {
    var body = CartBody(
      id: event.product.id,
      title: event.product.title,
      price: event.product.price,
      image: event.product.image,
      qty: 1,
    );
    await _addToCartProduct(body);
    AppSnackbar.show(message: 'Added to cart', type: SnackType.success);
  }

  void onFilterProduct(FilterProductEvent event, Emitter<ProductState> emit) {
    final filteredProducts = state.products
        ?.where((product) =>
            product.title?.toLowerCase().contains(event.query.toLowerCase()) ??
            false)
        .toList();

    emit(state.copyWith(filteredProducts: filteredProducts));
  }

  void onResetProduct(
      ResetFilterProductEvent event, Emitter<ProductState> emit) {
    emit(state.copyWith(filteredProducts: null));
  }
}
