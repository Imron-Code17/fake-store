// ignore_for_file: depend_on_referenced_packages

import 'package:fakestore/app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:fakestore/app/features/cart/presentation/utils/typedef.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCartProduct extends Mock implements CartProducts {}

void main() {
  late MockCartProduct mockCartProduct;
  setUp(() {
    mockCartProduct = MockCartProduct();
  });
  group('CartState', () {
    group('CartState, initial', () {
      CartState createSubjectInitial() {
        return const CartState(cartProducts: null, item: null, amount: null);
      }

      test('support value equality', () {
        expect(createSubjectInitial(), equals(createSubjectInitial()));
      });

      test('props are correct [initial]', () {
        expect(createSubjectInitial().props, equals([null, null, null]));
      });
    });

    group('CartState , success', () {
      CartState createSubjectSuccess() {
        return CartState(cartProducts: mockCartProduct, item: 1, amount: 1);
      }

      test('return a valid CartState', () {
        expect(createSubjectSuccess(), createSubjectSuccess());
      });

      test('props are correct [success]', () {
        expect(createSubjectSuccess().props, equals([mockCartProduct, 1, 1]));
      });
    });
  });
}
