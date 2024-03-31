import 'package:equatable/equatable.dart';
import 'package:fakestore/app/features/cart/data/models/cart_model.dart';

class CartEntity extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? image;
  final int? qty;

  const CartEntity({this.id, this.title, this.price, this.image, this.qty});

  factory CartEntity.fromModel(CartModel model) {
    return CartEntity(
        id: model.id,
        title: model.title,
        price: model.price,
        image: model.image,
        qty: model.qty);
  }

  factory CartEntity.fromJson(Map<String, dynamic> json) {
    return CartEntity(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      image: json['image'],
      qty: json['qty'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['image'] = image;
    data['qty'] = qty;
    return data;
  }

  CartEntity copyWith({
    int? id,
    String? title,
    double? price,
    String? image,
    int? qty,
  }) {
    return CartEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
      qty: qty ?? this.qty,
    );
  }

  @override
  List<Object?> get props => [id, title, price, image, qty];
}
