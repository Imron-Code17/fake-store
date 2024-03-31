part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetCategoriesEvent extends ProductEvent {}

class GetProductsEvent extends ProductEvent {}

class GetProductByCategoryEvent extends ProductEvent {
  final Category category;
  const GetProductByCategoryEvent({required this.category});
}

class GetDetailProductEvent extends ProductEvent {
  final ProductId productId;

  const GetDetailProductEvent({required this.productId});

  @override
  List<Object> get props => [productId];
}

class AddToFavoriteProductEvent extends ProductEvent {
  final ProductId productId;

  const AddToFavoriteProductEvent({required this.productId});

  @override
  List<Object> get props => [productId];
}

class RemoveFromFavoriteProductEvent extends ProductEvent {
  final ProductId productId;

  const RemoveFromFavoriteProductEvent({required this.productId});

  @override
  List<Object> get props => [productId];
}

class CheckFavoriteProductEvent extends ProductEvent {
  final ProductId productId;

  const CheckFavoriteProductEvent({required this.productId});

  @override
  List<Object> get props => [productId];
}

class AddToCartProductEvent extends ProductEvent {
  final Product product;

  const AddToCartProductEvent({required this.product});

  @override
  List<Object> get props => [product];
}

class FilterProductEvent extends ProductEvent {
  final String query;
  const FilterProductEvent({required this.query});

  @override
  List<Object> get props => [query];
}

class ResetFilterProductEvent extends ProductEvent {}
