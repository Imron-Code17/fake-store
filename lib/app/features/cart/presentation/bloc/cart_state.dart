part of 'cart_bloc.dart';

class CartState extends Equatable {
  final CartProducts? cartProducts;
  final Item? item;
  final Amount? amount;
  const CartState({
    this.cartProducts,
    this.item,
    this.amount,
  });

  factory CartState.init() {
    return const CartState(cartProducts: null, item: null, amount: null);
  }

  CartState copyWith({
    CartProducts? cartProducts,
    Item? item,
    Amount? amount,
  }) {
    return CartState(
        cartProducts: cartProducts ?? this.cartProducts,
        item: item ?? this.item,
        amount: amount ?? this.amount);
  }

  @override
  List<Object?> get props => [cartProducts, item, amount];
}
