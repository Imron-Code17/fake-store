part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class GetCartProductsEvent extends CartEvent {}

class AddQuantityEvent extends CartEvent {
  final ProductId productId;
  final ProductQuantity quantity;

  const AddQuantityEvent({required this.productId, required this.quantity});

  @override
  List<Object> get props => [productId, quantity];
}

class RemoveQuantityEvent extends CartEvent {
  final ProductId productId;
  final ProductQuantity quantity;

  const RemoveQuantityEvent({required this.productId, required this.quantity});

  @override
  List<Object> get props => [productId, quantity];
}

class DeleteCartProductEvent extends CartEvent {
  final ProductId productId;

  const DeleteCartProductEvent({required this.productId});

  @override
  List<Object> get props => [productId];
}

class DeleteAllCartProductEvent extends CartEvent {}
