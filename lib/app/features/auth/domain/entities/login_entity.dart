import 'package:equatable/equatable.dart';

import '../../data/models/login_response.dart';

class LoginEntity extends Equatable {
  final String? accessToken;
  final String? refreshToken;

  const LoginEntity({this.accessToken, this.refreshToken});

  factory LoginEntity.fromModel(LoginResponse model) {
    return LoginEntity(
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  @override
  List<Object?> get props => [accessToken, refreshToken];
}
