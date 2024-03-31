import '../../../../core/network/endpoints.dart';
import '../../../../core/network/remote_data_source_impl.dart';
import '../../../../core/network/request_remote.dart';
import '../../presentation/utils/models/login_body.dart';
import '../models/login_response.dart';
import 'auth_data_sources.dart';

class AuthRemoteDataSourcesImpl extends RemoteDataSourceImpl
    implements AuthRemoteDataSources {
  AuthRemoteDataSourcesImpl(super.client);

  @override
  Future<LoginResponse> todoLogin(LoginBody body) async {
    final response = await hitAPI(() => post(Endpoints.login, body));
    return LoginResponse.fromJson(response);
  }
}
