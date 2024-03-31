// ignore_for_file: depend_on_referenced_packages

import 'package:bloc_test/bloc_test.dart';
import 'package:fakestore/app/features/cart/domain/entities/cart_entity.dart';
import 'package:fakestore/app/features/cart/domain/usecase/add_quantity_product.dart';
import 'package:fakestore/app/features/cart/domain/usecase/delete_all_cart_product.dart';
import 'package:fakestore/app/features/cart/domain/usecase/delete_cart_product.dart';
import 'package:fakestore/app/features/cart/domain/usecase/get_cart_product.dart';
import 'package:fakestore/app/features/cart/domain/usecase/remove_quantity_product.dart';
import 'package:fakestore/app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetCartProduct extends Mock implements GetCartProduct {}

class MockAddQtyCartProduct extends Mock implements AddQtyCartProduct {}

class MockRemoveQtyCartProduct extends Mock implements RemoveQtyCartProduct {}

class MockDeleteCartProducts extends Mock implements DeleteCartProducts {}

class MockDeleteAllCartProducts extends Mock implements DeleteAllCartProducts {}

class MockCartEntity extends Mock implements CartEntity {}

void main() {
  late MockGetCartProduct mockGetCartProduct;
  late MockAddQtyCartProduct mockAddQtyCartProduct;
  late MockRemoveQtyCartProduct mockRemoveQtyCartProduct;
  late MockDeleteCartProducts mockDeleteCartProducts;
  late MockDeleteAllCartProducts mockDeleteAllCartProducts;
  late MockCartEntity mockCartEntity;
  late CartBloc cartBloc;

  setUp(() {
    mockGetCartProduct = MockGetCartProduct();
    mockAddQtyCartProduct = MockAddQtyCartProduct();
    mockRemoveQtyCartProduct = MockRemoveQtyCartProduct();
    mockDeleteCartProducts = MockDeleteCartProducts();
    mockDeleteAllCartProducts = MockDeleteAllCartProducts();
    mockCartEntity = MockCartEntity();

    cartBloc = CartBloc(
      mockGetCartProduct,
      mockAddQtyCartProduct,
      mockRemoveQtyCartProduct,
      mockDeleteCartProducts,
      mockDeleteAllCartProducts,
    );
  });

  group('CartBloc', () {
    test('initial state is correct', () {
      expect(cartBloc.state, equals(CartState.init()));
    });

    blocTest<CartBloc, CartState>(
      'emits [loading, success] when GetCartProductsEvent is added and succeeds',
      build: () {
        when(() => mockGetCartProduct())
            .thenAnswer((_) async => [mockCartEntity]);
        return cartBloc;
      },
      act: (bloc) => bloc.add(GetCartProductsEvent()),
      expect: () => [
        CartState.init().copyWith(
          cartProducts: [mockCartEntity],
          item: 1,
          amount: 0.0,
        ),
      ],
    );
  });
}
