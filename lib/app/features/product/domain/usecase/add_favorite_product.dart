import 'package:fakestore/app/features/product/domain/repositories/product_repositories.dart';
import 'package:fakestore/app/features/product/presentation/utils/typedef.dart';
import '../../../../core/usecase/usecase.dart';

class AddFavoriteProduct extends UseCaseWithoutEither<void, ProductId> {
  final ProductRepositories _productRepositories;
  AddFavoriteProduct(this._productRepositories);

  @override
  Future<void> call(ProductId param) async {
    return _productRepositories.addFavoriteProduct(param);
  }
}
