import 'package:fakestore/app/features/cart/presentation/utils/typedef.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/cart_repositories.dart';

class GetCartProduct extends UseCaseWithoutEitheArg<CartProducts> {
  final CartRepositories _cartRepositories;
  GetCartProduct(this._cartRepositories);

  @override
  Future<CartProducts> call() async {
    return _cartRepositories.getCartProducts();
  }
}
