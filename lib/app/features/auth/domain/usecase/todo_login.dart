// ignore_for_file: avoid_renaming_method_parameters

import 'package:fpdart/fpdart.dart';

import '../../../../core/error/error_imports.dart';
import '../../../../core/usecase/usecase.dart';
import '../../presentation/utils/models/login_body.dart';
import '../entities/login_entity.dart';
import '../repositories/auth_repositories.dart';

class TodoLoginUseCase extends UseCase<LoginEntity, LoginBody> {
  final AuthRepositories _authRepositories;

  TodoLoginUseCase(this._authRepositories);

  @override
  Future<Either<RemoteFailure, LoginEntity>> call(LoginBody param) {
    return _authRepositories.todoLogin(param);
  }
}
