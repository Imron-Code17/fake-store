import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fakestore/app/features/cart/domain/usecase/add_quantity_product.dart';
import 'package:fakestore/app/features/cart/domain/usecase/get_cart_product.dart';
import 'package:fakestore/app/features/cart/domain/usecase/remove_quantity_product.dart';
import 'package:fakestore/app/features/cart/presentation/utils/models/cart_params.dart';
import '../../domain/usecase/delete_all_cart_product.dart';
import '../../domain/usecase/delete_cart_product.dart';
import '../utils/typedef.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartProduct _getCartProduct;
  final AddQtyCartProduct _addQtyCartProduct;
  final RemoveQtyCartProduct _removeQtyCartProduct;
  final DeleteCartProducts _deleteCartProduct;
  final DeleteAllCartProducts _deleteAllCartProduct;

  CartBloc(
      this._getCartProduct,
      this._addQtyCartProduct,
      this._removeQtyCartProduct,
      this._deleteCartProduct,
      this._deleteAllCartProduct)
      : super(CartState.init()) {
    on<GetCartProductsEvent>(onGetCartProduct);
    on<AddQuantityEvent>(onAddQuantity);
    on<RemoveQuantityEvent>(onRemoveQuantity);
    on<DeleteCartProductEvent>(onDeleteCartProduct);
    on<DeleteAllCartProductEvent>(onDeleteAllCartProduct);
  }

  void onGetCartProduct(
      GetCartProductsEvent event, Emitter<CartState> emit) async {
    final result = await _getCartProduct();
    final totalAmount = calculateTotalAmount(result);
    emit(state.copyWith(
        cartProducts: result, item: result.length, amount: totalAmount));
  }

  void onAddQuantity(AddQuantityEvent event, Emitter<CartState> emit) async {
    var params =
        CartParams(productId: event.productId, quantity: event.quantity);
    await _addQtyCartProduct(params);
    final result = await _getCartProduct();
    final totalAmount = calculateTotalAmount(result);
    emit(state.copyWith(
        cartProducts: result, item: result.length, amount: totalAmount));
  }

  void onRemoveQuantity(
      RemoveQuantityEvent event, Emitter<CartState> emit) async {
    var params =
        CartParams(productId: event.productId, quantity: event.quantity);
    await _removeQtyCartProduct(params);
    final result = await _getCartProduct();
    final totalAmount = calculateTotalAmount(result);
    emit(state.copyWith(
        cartProducts: result, item: result.length, amount: totalAmount));
  }

  void onDeleteCartProduct(
      DeleteCartProductEvent event, Emitter<CartState> emit) async {
    var params = CartParams(productId: event.productId);
    await _deleteCartProduct(params);
    final result = await _getCartProduct();
    final totalAmount = calculateTotalAmount(result);
    emit(state.copyWith(
        cartProducts: result, item: result.length, amount: totalAmount));
  }

  void onDeleteAllCartProduct(
      DeleteAllCartProductEvent event, Emitter<CartState> emit) async {
    await _deleteAllCartProduct();
    final result = await _getCartProduct();
    final totalAmount = calculateTotalAmount(result);
    emit(state.copyWith(
        cartProducts: result, item: result.length, amount: totalAmount));
  }

  double calculateTotalAmount(CartProducts cartProducts) {
    double totalAmount = 0;
    for (var product in cartProducts) {
      totalAmount += ((product.price ?? 0) * (product.qty ?? 0));
    }
    return totalAmount;
  }
}
