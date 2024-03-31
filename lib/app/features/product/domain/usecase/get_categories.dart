import 'package:fakestore/app/features/product/domain/repositories/product_repositories.dart';
import 'package:fakestore/app/features/product/presentation/utils/typedef.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';

class GetCategories extends UseCaseWithoutArgument<Categories> {
  final ProductRepositories _productRepositories;
  GetCategories(this._productRepositories);

  @override
  Future<Either<RemoteFailure, Categories>> call() async {
    return _productRepositories.getCategories();
  }
}
