part of 'product_bloc.dart';

enum CategoryStatus { initial, loading, success, failure }

enum ProductStatus { initial, loading, success, failure }

enum DetailProductStatus { initial, loading, success, failure }

class ProductState extends Equatable {
  final CategoryStatus? categoryStatus;
  final Categories? categories;
  final Category? selectedCategory;
  final bool? selectCategory;
  final ProductStatus? productStatus;
  final Products? products;
  final Products? filteredProducts;
  final DetailProductStatus? detailProductStatus;
  final Product? detailProduct;
  final FavoriteProduct? favoriteProduct;

  const ProductState(
      {this.categoryStatus,
      this.productStatus,
      this.detailProductStatus,
      this.categories,
      this.selectedCategory,
      this.selectCategory = false,
      this.products,
      this.detailProduct,
      this.favoriteProduct,
      this.filteredProducts});

  factory ProductState.init() {
    return const ProductState(
      categories: [],
      products: [],
      detailProduct: null,
      selectCategory: false,
      categoryStatus: CategoryStatus.initial,
      productStatus: ProductStatus.initial,
      detailProductStatus: DetailProductStatus.initial,
      favoriteProduct: false,
      selectedCategory: null,
      filteredProducts: null,
    );
  }

  ProductState copyWith({
    CategoryStatus? categoryStatus,
    Categories? categories,
    Category? selectedCategory,
    bool? selectCategory,
    ProductStatus? productStatus,
    Products? products,
    Products? filteredProducts,
    DetailProductStatus? detailProductStatus,
    Product? detailProduct,
    FavoriteProduct? favoriteProduct,
  }) {
    return ProductState(
        categoryStatus: categoryStatus ?? this.categoryStatus,
        categories: categories ?? this.categories,
        selectedCategory: selectedCategory ?? this.selectedCategory,
        selectCategory: selectCategory ?? this.selectCategory,
        productStatus: productStatus ?? this.productStatus,
        products: products ?? this.products,
        filteredProducts: filteredProducts ?? this.filteredProducts,
        detailProductStatus: detailProductStatus ?? this.detailProductStatus,
        detailProduct: detailProduct ?? this.detailProduct,
        favoriteProduct: favoriteProduct ?? this.favoriteProduct);
  }

  @override
  List<Object?> get props => [
        categoryStatus,
        categories,
        selectedCategory,
        selectCategory,
        productStatus,
        products,
        filteredProducts,
        detailProductStatus,
        detailProduct,
        favoriteProduct
      ];
}
