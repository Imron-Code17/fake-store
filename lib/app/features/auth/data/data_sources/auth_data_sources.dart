import '../../presentation/utils/models/login_body.dart';
import '../models/login_response.dart';

abstract class AuthRemoteDataSources {
  Future<LoginResponse> todoLogin(LoginBody body);
}
