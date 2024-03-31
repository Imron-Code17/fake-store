import '../../../../core/usecase/usecase.dart';
import '../repositories/cart_repositories.dart';

class DeleteAllCartProducts extends UseCaseWithoutEitheArg<void> {
  final CartRepositories _cartRepositories;
  DeleteAllCartProducts(this._cartRepositories);

  @override
  Future<void> call() async {
    return _cartRepositories.deleteAllProduct();
  }
}
