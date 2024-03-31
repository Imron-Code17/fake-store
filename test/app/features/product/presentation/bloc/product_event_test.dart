import 'package:fakestore/app/features/product/presentation/bloc/product_bloc.dart';
import 'package:fakestore/app/features/product/presentation/utils/typedef.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ProductId productId = 1;

  const product = Product();

  group('ProductEvent', () {
    group('GetCategoriesEvent', () {
      test('support value equality', () {
        expect(GetCategoriesEvent(), GetCategoriesEvent());
      });

      test('props are correct', () {
        expect(GetCategoriesEvent().props, equals(<Object?>[]));
      });
    });

    group('GetProductsEvent', () {
      test('support value equality', () {
        expect(GetProductsEvent(), GetProductsEvent());
      });

      test('props are correct', () {
        expect(GetProductsEvent().props, equals(<Object?>[]));
      });
    });

    group('GetDetailProductEvent', () {
      test('supports value equality', () {
        expect(
          GetDetailProductEvent(productId: productId),
          GetDetailProductEvent(productId: productId),
        );
      });

      test('props are correct', () {
        expect(
          GetDetailProductEvent(productId: productId).props,
          equals([productId]),
        );
      });
    });

    group('RemoveFromFavoriteProductEvent', () {
      test('supports value equality', () {
        expect(
          RemoveFromFavoriteProductEvent(productId: productId),
          RemoveFromFavoriteProductEvent(productId: productId),
        );
      });

      test('props are correct', () {
        expect(
          RemoveFromFavoriteProductEvent(productId: productId).props,
          equals([productId]),
        );
      });
    });

    group('CheckFavoriteProductEvent', () {
      test('supports value equality', () {
        expect(
          CheckFavoriteProductEvent(productId: productId),
          CheckFavoriteProductEvent(productId: productId),
        );
      });

      test('props are correct', () {
        expect(
          CheckFavoriteProductEvent(productId: productId).props,
          equals([productId]),
        );
      });
    });

    group('AddToCartProductEvent', () {
      test('supports value equality', () {
        expect(
          const AddToCartProductEvent(product: product),
          const AddToCartProductEvent(product: product),
        );
      });

      test('props are correct', () {
        expect(
          const AddToCartProductEvent(product: product).props,
          equals([product]),
        );
      });
    });

    group('FilterProductEvent', () {
      test('supports value equality', () {
        expect(
          const FilterProductEvent(query: 'test'),
          const FilterProductEvent(query: 'test'),
        );
      });

      test('props are correct', () {
        expect(
          const FilterProductEvent(query: 'test').props,
          equals(['test']),
        );
      });
    });

    group('ResetFilterProductEvent', () {
      test('support value equality', () {
        expect(ResetFilterProductEvent(), ResetFilterProductEvent());
      });

      test('props are correct', () {
        expect(ResetFilterProductEvent().props, equals(<Object?>[]));
      });
    });
  });
}
