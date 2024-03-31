import '../../../../../core/network/param.dart';

class LoginBody implements RequestBody {
  final String? username;
  final String? password;

  LoginBody({this.username, this.password});

  @override
  Map<String, dynamic> toJson() => {'username': username, 'password': password};

  LoginBody copyWith({
    String? username,
    String? password,
  }) {
    return LoginBody(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
