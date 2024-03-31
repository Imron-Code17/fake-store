import 'package:fakestore/app/features/product/domain/repositories/product_repositories.dart';
import 'package:fakestore/app/features/product/presentation/utils/typedef.dart';
import '../../../../core/usecase/usecase.dart';

class CheckFavoriteProducts
    extends UseCaseWithoutEither<FavoriteProduct, ProductId> {
  final ProductRepositories _productRepositories;
  CheckFavoriteProducts(this._productRepositories);

  @override
  Future<FavoriteProduct> call(ProductId param) async {
    return _productRepositories.isFavoriteProduct(param);
  }
}
