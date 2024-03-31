import 'package:fakestore/app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:fakestore/app/features/product/presentation/utils/typedef.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ProductId productId = 1;

  group('CartEvent', () {
    group('GetCartProductsEvent', () {
      test('support value equality', () {
        expect(GetCartProductsEvent(), GetCartProductsEvent());
      });

      test('props are correct', () {
        expect(GetCartProductsEvent().props, equals(<Object?>[]));
      });
    });

    group('AddQuantityEvent', () {
      test('supports value equality', () {
        expect(
          AddQuantityEvent(productId: productId, quantity: 1),
          AddQuantityEvent(productId: productId, quantity: 1),
        );
      });

      test('props are correct', () {
        expect(
          AddQuantityEvent(productId: productId, quantity: 1).props,
          equals([productId, 1]),
        );
      });
    });

    group('RemoveQuantityEvent', () {
      test('supports value equality', () {
        expect(
          RemoveQuantityEvent(productId: productId, quantity: 1),
          RemoveQuantityEvent(productId: productId, quantity: 1),
        );
      });

      test('props are correct', () {
        expect(
          RemoveQuantityEvent(productId: productId, quantity: 1).props,
          equals([productId, 1]),
        );
      });
    });

    group('DeleteCartProductEvent', () {
      test('supports value equality', () {
        expect(
          DeleteCartProductEvent(productId: productId),
          DeleteCartProductEvent(productId: productId),
        );
      });

      test('props are correct', () {
        expect(
          DeleteCartProductEvent(productId: productId).props,
          equals([productId]),
        );
      });
    });

    group('DeleteAllCartProductEvent', () {
      test('support value equality', () {
        expect(DeleteAllCartProductEvent(), DeleteAllCartProductEvent());
      });

      test('props are correct', () {
        expect(DeleteAllCartProductEvent().props, equals(<Object?>[]));
      });
    });
  });
}
