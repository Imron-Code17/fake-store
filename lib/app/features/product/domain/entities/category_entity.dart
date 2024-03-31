import 'package:equatable/equatable.dart';
import 'package:fakestore/app/features/product/data/models/category_model.dart';

class CategoryEntity extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final String? creationAt;
  final String? updatedAt;

  const CategoryEntity(
      {this.id, this.name, this.image, this.creationAt, this.updatedAt});

  factory CategoryEntity.fromModel(CategoryModel model) {
    return CategoryEntity(
      id: model.id,
      name: model.name,
      image: model.image,
      creationAt: model.creationAt,
      updatedAt: model.updatedAt,
    );
  }

  @override
  List<Object?> get props => [id, name, image, creationAt, updatedAt];
}
