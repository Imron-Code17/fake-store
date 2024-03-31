import 'package:fakestore/app/features/product/domain/repositories/product_repositories.dart';
import 'package:fakestore/app/features/product/presentation/utils/typedef.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';

class GetProductsDetail extends UseCase<Product, ProductId> {
  final ProductRepositories _productRepositories;
  GetProductsDetail(this._productRepositories);

  @override
  Future<Either<RemoteFailure, Product>> call(ProductId argument) async {
    return _productRepositories.getProductDetail(argument);
  }
}
