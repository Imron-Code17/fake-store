import 'package:fakestore/app/features/product/domain/repositories/product_repositories.dart';
import 'package:fakestore/app/features/product/presentation/utils/typedef.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';

class GetProductsByCategory extends UseCase<Products, CategoryName> {
  final ProductRepositories _productRepositories;
  GetProductsByCategory(this._productRepositories);

  @override
  Future<Either<RemoteFailure, Products>> call(CategoryName argument) async {
    return _productRepositories.getProductByCategory(argument);
  }
}
