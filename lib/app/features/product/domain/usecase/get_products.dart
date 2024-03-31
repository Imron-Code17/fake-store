import 'package:fakestore/app/features/product/domain/repositories/product_repositories.dart';
import 'package:fakestore/app/features/product/presentation/utils/typedef.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';

class GetProducts extends UseCaseWithoutArgument<Products> {
  final ProductRepositories _productRepositories;
  GetProducts(this._productRepositories);

  @override
  Future<Either<RemoteFailure, Products>> call() async {
    return _productRepositories.getProducts();
  }
}
