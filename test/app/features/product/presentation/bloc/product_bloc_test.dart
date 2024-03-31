// ignore_for_file: depend_on_referenced_packages

import 'package:bloc_test/bloc_test.dart';
import 'package:fakestore/app/features/product/domain/entities/product_entity.dart';
import 'package:fakestore/app/features/product/domain/usecase/add_favorite_product.dart';
import 'package:fakestore/app/features/product/domain/usecase/add_to_cart.dart';
import 'package:fakestore/app/features/product/domain/usecase/check_favorite_product.dart';
import 'package:fakestore/app/features/product/domain/usecase/get_categories.dart';
import 'package:fakestore/app/features/product/domain/usecase/get_product_by_category.dart';
import 'package:fakestore/app/features/product/domain/usecase/get_product_detail.dart';
import 'package:fakestore/app/features/product/domain/usecase/get_products.dart';
import 'package:fakestore/app/features/product/domain/usecase/remove_favorite_product.dart';
import 'package:fakestore/app/features/product/presentation/bloc/product_bloc.dart';
import 'package:fakestore/app/features/product/presentation/utils/models/cart_product_body.dart';
import 'package:fakestore/app/features/product/presentation/utils/typedef.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockGetCategories extends Mock implements GetCategories {}

class MockGetProducts extends Mock implements GetProducts {}

class MockGetProductsByCategory extends Mock implements GetProductsByCategory {}

class MockGetProductDetail extends Mock implements GetProductsDetail {}

class MockAddFavoriteProduct extends Mock implements AddFavoriteProduct {}

class MockRemoveFavoriteProduct extends Mock implements RemoveFavoriteProduct {}

class MockCheckFavoriteProduct extends Mock implements CheckFavoriteProducts {}

class MockAddToCartProduct extends Mock implements AddToCartProduct {}

class CartBodyFake extends Fake implements CartBody {}

void main() {
  late MockGetCategories mockGetCategories;
  late MockGetProducts mockGetProducts;
  late MockGetProductsByCategory mockGetProductsByCategory;
  late MockGetProductDetail mockGetProductDetail;
  late MockAddFavoriteProduct mockAddFavoriteProduct;
  late MockRemoveFavoriteProduct mockRemoveFavoriteProduct;
  late MockCheckFavoriteProduct mockCheckFavoriteProduct;
  late MockAddToCartProduct mockAddToCartProduct;

  late ProductBloc productBloc;

  setUp(() {
    mockGetCategories = MockGetCategories();
    mockGetProducts = MockGetProducts();
    mockGetProductsByCategory = MockGetProductsByCategory();
    mockGetProductDetail = MockGetProductDetail();
    mockAddFavoriteProduct = MockAddFavoriteProduct();
    mockRemoveFavoriteProduct = MockRemoveFavoriteProduct();
    mockCheckFavoriteProduct = MockCheckFavoriteProduct();
    mockAddToCartProduct = MockAddToCartProduct();

    productBloc = ProductBloc(
      mockGetCategories,
      mockGetProductsByCategory,
      mockGetProducts,
      mockGetProductDetail,
      mockAddFavoriteProduct,
      mockRemoveFavoriteProduct,
      mockCheckFavoriteProduct,
      mockAddToCartProduct,
    );
  });

  const categories = ['electronics', 'jewelery'];
  const selectedCategory = "men's clothing";
  Product? product = const Product(
      id: 1,
      title: 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
      price: 109.95,
      description:
          "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
      category: "men's clothing",
      image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      rating: RatingEntity(rate: 3.9, count: 120));

  group('ProductBloc', () {
    test('initial state is correct', () {
      expect(productBloc.state, equals(ProductState.init()));
    });

    blocTest<ProductBloc, ProductState>(
      'emits [loading, success] when GetCategoriesEvent is added and succeeds',
      build: () {
        when(() => mockGetCategories()).thenAnswer(
          (_) => Future.value(const Right(categories)),
        );
        return productBloc;
      },
      act: (bloc) => bloc.add(GetCategoriesEvent()),
      expect: () => [
        ProductState.init().copyWith(categoryStatus: CategoryStatus.loading),
        ProductState.init().copyWith(
            categoryStatus: CategoryStatus.success,
            selectedCategory: 'All',
            categories: ['All', ...categories]),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [loading, success] when GetProductsEvent is added and succeeds',
      build: () {
        when(() => mockGetProducts()).thenAnswer(
          (_) => Future.value(Right([product])),
        );
        return productBloc;
      },
      act: (bloc) => bloc.add(GetProductsEvent()),
      expect: () => [
        ProductState.init().copyWith(productStatus: ProductStatus.loading),
        ProductState.init().copyWith(
            productStatus: ProductStatus.success, products: [product]),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [loading, success] when GetProductByCategoryEvent is added and succeeds',
      build: () {
        when(() => mockGetProductsByCategory(selectedCategory))
            .thenAnswer((_) => Future.value(Right([product])));
        return productBloc;
      },
      act: (bloc) {
        bloc.add(const GetProductByCategoryEvent(category: selectedCategory));
      },
      expect: () => [
        ProductState.init().copyWith(
          productStatus: ProductStatus.loading,
          selectedCategory: selectedCategory,
          selectCategory: true,
        ),
        ProductState.init().copyWith(
          productStatus: ProductStatus.success,
          products: [product],
          selectedCategory: selectedCategory,
          selectCategory: true,
        ),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [loading, success] when GetDetailProductEvent is added and succeeds',
      build: () {
        when(() => mockGetProductDetail(1)).thenAnswer(
          (_) => Future.value(Right(product)),
        );
        return productBloc;
      },
      act: (bloc) => bloc.add(const GetDetailProductEvent(productId: 1)),
      expect: () => [
        ProductState.init()
            .copyWith(detailProductStatus: DetailProductStatus.loading),
        ProductState.init().copyWith(
          detailProductStatus: DetailProductStatus.success,
          detailProduct: product,
        ),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'onAddToFavoriteProduct emits correct states',
      build: () {
        when(() => mockAddFavoriteProduct(1)).thenAnswer((_) async {});
        return productBloc;
      },
      act: (bloc) => bloc.add(const AddToFavoriteProductEvent(productId: 1)),
      expect: () => [
        ProductState.init().copyWith(favoriteProduct: true),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'onRemoveFromFavoriteProduct emits correct states',
      build: () {
        when(() => mockRemoveFavoriteProduct(1)).thenAnswer((_) async {});
        return productBloc;
      },
      act: (bloc) =>
          bloc.add(const RemoveFromFavoriteProductEvent(productId: 1)),
      expect: () => [
        ProductState.init().copyWith(favoriteProduct: false),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'checkFavoriteProduct emits correct states',
      build: () {
        when(() => mockCheckFavoriteProduct(1)).thenAnswer((_) async => true);
        return productBloc;
      },
      act: (bloc) => bloc.add(const CheckFavoriteProductEvent(productId: 1)),
      expect: () => [
        ProductState.init().copyWith(favoriteProduct: true),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'onFilterProduct emits correct states',
      build: () => productBloc,
      act: (bloc) => bloc.add(const FilterProductEvent(query: 'fja')),
      expect: () => [
        ProductState.init().copyWith(filteredProducts: []),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'onResetProduct emits correct states',
      build: () => productBloc,
      act: (bloc) => bloc.add(ResetFilterProductEvent()),
      expect: () => [
        ProductState.init().copyWith(filteredProducts: null),
      ],
    );
  });
}
