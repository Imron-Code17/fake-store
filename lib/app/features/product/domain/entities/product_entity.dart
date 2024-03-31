import 'package:equatable/equatable.dart';
import 'package:fakestore/app/features/product/data/models/product_model.dart';

class ProductEntity extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final RatingEntity? rating;

  const ProductEntity(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  factory ProductEntity.fromModel(ProductModel model) => ProductEntity(
        id: model.id,
        title: model.title,
        price: model.price,
        description: model.description,
        category: model.category,
        image: model.image,
        rating:
            model.rating != null ? RatingEntity.fromModel(model.rating!) : null,
      );

  @override
  List<Object?> get props =>
      [id, title, price, description, category, image, rating];
}

class RatingEntity extends Equatable {
  final double? rate;
  final int? count;

  const RatingEntity({this.rate, this.count});

  RatingEntity.fromModel(RatingModel model)
      : this(rate: model.rate, count: model.count);

  @override
  List<Object?> get props => [rate, count];
}
