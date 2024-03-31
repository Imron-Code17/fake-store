part of 'auth_bloc.dart';

enum AuthStatus { initial, loading, success, failure }

class AuthState extends Equatable {
  const AuthState({this.status, this.username, this.password});

  final AuthStatus? status;
  final String? username;
  final String? password;

  factory AuthState.init() {
    return const AuthState(
      status: AuthStatus.initial,
      username: '',
      password: '',
    );
  }

  AuthState copyWith({AuthStatus? status, String? username, String? password}) {
    return AuthState(
        status: status ?? AuthStatus.initial,
        username: username ?? this.username,
        password: password ?? this.password);
  }

  @override
  List<Object?> get props => [status, username, password];
}
