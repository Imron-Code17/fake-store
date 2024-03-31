import 'package:fakestore/app/features/auth/data/data_sources/auth_data_sources.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/error_imports.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/auth_repositories.dart';
import '../../presentation/utils/models/login_body.dart';

class AuthRepositoriesImpl implements AuthRepositories {
  final AuthRemoteDataSources _authRemoteDataSource;
  AuthRepositoriesImpl(this._authRemoteDataSource);

  @override
  Future<Either<RemoteFailure, LoginEntity>> todoLogin(LoginBody body) async {
    try {
      final data = await _authRemoteDataSource.todoLogin(body);
      final response = LoginEntity.fromModel(data);
      return Right(response);
    } on ServerException catch (e) {
      return Left(RemoteFailure(e));
    }
  }
}
