import 'package:fakestore/app/features/product/domain/entities/product_entity.dart';
import 'package:fakestore/app/features/product/presentation/bloc/product_bloc.dart';
import 'package:fakestore/app/features/product/presentation/utils/typedef.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductState', () {
    group('ProductState, initial', () {
      ProductState createSubjectInitial() {
        return const ProductState(
            categoryStatus: CategoryStatus.initial,
            categories: null,
            selectedCategory: null,
            selectCategory: false,
            productStatus: ProductStatus.initial,
            products: null,
            filteredProducts: null,
            detailProductStatus: DetailProductStatus.initial,
            detailProduct: null,
            favoriteProduct: false);
      }

      test('support value equality', () {
        expect(createSubjectInitial(), equals(createSubjectInitial()));
      });

      test('propos are correct [initial]', () {
        expect(
            createSubjectInitial().props,
            equals(<Object?>[
              CategoryStatus.initial,
              null,
              null,
              false,
              ProductStatus.initial,
              null,
              null,
              DetailProductStatus.initial,
              null,
              false
            ]));
      });
    });

    group('ProductState , success', () {
      const categories = ['electronics', 'jewelery'];
      const selectedCategory = 'electronics';
      Product? product = const Product(
          id: 1,
          title: 'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
          price: 109.95,
          description:
              "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
          category: "men's clothing",
          image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          rating: RatingEntity(rate: 3.9, count: 120));
      ProductState createSubjectSuccess() {
        return ProductState(
            categoryStatus: CategoryStatus.success,
            categories: categories,
            selectedCategory: selectedCategory,
            selectCategory: true,
            productStatus: ProductStatus.success,
            products: [product],
            filteredProducts: [product],
            detailProductStatus: DetailProductStatus.success,
            detailProduct: product,
            favoriteProduct: true);
      }

      test('return a valid ProductState', () {
        expect(createSubjectSuccess(), createSubjectSuccess());
      });

      test('propos are correct [success]', () {
        expect(
            createSubjectSuccess().props,
            equals(<Object?>[
              CategoryStatus.success,
              categories,
              selectedCategory,
              true,
              ProductStatus.success,
              [product],
              [product],
              DetailProductStatus.success,
              product,
              true
            ]));
      });
    });
  });
}
