import 'package:fakestore/app/features/product/data/models/product_model.dart';

import '../../../../../core/network/endpoints.dart';
import '../../../../../core/network/remote_data_source_impl.dart';
import '../../../../../core/network/request_remote.dart';
import '../../../presentation/utils/typedef.dart';
import 'product_remote_data_sources.dart';

class ProductRemoteDataSourcesImpl extends RemoteDataSourceImpl
    implements ProductRemoteDataSources {
  ProductRemoteDataSourcesImpl(super.client);

  @override
  Future<List<String>> getCategories() async {
    final response = await hitAPI(() => get(Endpoints.categories));
    return List<String>.from(response);
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await hitAPI(() => get(Endpoints.products));
    return List.from(response).map((e) => ProductModel.fromJson(e)).toList();
  }

  @override
  Future<List<ProductModel>> getProductByCategory(CategoryName category) async {
    final response =
        await hitAPI(() => get('${Endpoints.productsByCategories}/$category'));
    return List.from(response).map((e) => ProductModel.fromJson(e)).toList();
  }

  @override
  Future<ProductModel> getProductDetail(ProductId id) async {
    final response = await hitAPI(() => get('${Endpoints.products}/$id'));
    return ProductModel.fromJson(response);
  }
}
