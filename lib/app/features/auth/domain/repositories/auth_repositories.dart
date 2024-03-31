import 'package:fpdart/fpdart.dart';

import '../../../../core/error/error_imports.dart';
import '../../presentation/utils/models/login_body.dart';
import '../entities/login_entity.dart';

abstract class AuthRepositories {
  Future<Either<RemoteFailure, LoginEntity>> todoLogin(LoginBody body);
}
