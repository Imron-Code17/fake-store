import 'package:fakestore/app/features/product/data/models/product_model.dart';
import '../../../presentation/utils/typedef.dart';

abstract class ProductRemoteDataSources {
  Future<List<String>> getCategories();
  Future<List<ProductModel>> getProducts();
  Future<List<ProductModel>> getProductByCategory(CategoryName category);
  Future<ProductModel> getProductDetail(ProductId id);
}
