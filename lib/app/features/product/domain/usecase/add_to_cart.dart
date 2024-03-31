import 'package:fakestore/app/features/product/domain/repositories/product_repositories.dart';
import 'package:fakestore/app/features/product/presentation/utils/models/cart_product_body.dart';
import '../../../../core/usecase/usecase.dart';

class AddToCartProduct extends UseCaseWithoutEither<void, CartBody> {
  final ProductRepositories _productRepositories;
  AddToCartProduct(this._productRepositories);

  @override
  Future<void> call(CartBody param) async {
    return _productRepositories.addToCart(param);
  }
}
