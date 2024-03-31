import '../../../../core/usecase/usecase.dart';
import '../../presentation/utils/models/cart_params.dart';
import '../repositories/cart_repositories.dart';

class RemoveQtyCartProduct extends UseCaseWithoutEither<void, CartParams> {
  final CartRepositories _cartRepositories;
  RemoveQtyCartProduct(this._cartRepositories);

  @override
  Future<void> call(CartParams param) async {
    return _cartRepositories.removeQuantity(param);
  }
}
