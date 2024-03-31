import 'package:fakestore/app/features/product/domain/repositories/product_repositories.dart';
import 'package:fakestore/app/features/product/presentation/utils/typedef.dart';
import '../../../../core/usecase/usecase.dart';

class RemoveFavoriteProduct extends UseCaseWithoutEither<void, ProductId> {
  final ProductRepositories _productRepositories;
  RemoveFavoriteProduct(this._productRepositories);

  @override
  Future<void> call(ProductId param) async {
    return _productRepositories.removeProductFromCart(param);
  }
}
