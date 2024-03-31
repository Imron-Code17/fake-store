// ignore_for_file: depend_on_referenced_packages

import 'package:fakestore/app/features/auth/domain/entities/login_entity.dart';
import 'package:fakestore/app/features/auth/domain/usecase/todo_login.dart';
import 'package:fakestore/app/features/auth/presentation/utils/models/login_body.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import 'package:fakestore/app/features/auth/presentation/bloc/auth/auth_bloc.dart';

class MockTodoLoginUseCase extends Mock implements TodoLoginUseCase {}

class MockAuthResult extends Mock implements LoginEntity {}

void main() {
  late MockTodoLoginUseCase mockTodoLoginUseCase;
  late AuthBloc authBloc;

  setUpAll(() {
    registerFallbackValue(LoginBody(username: 'mor_2314', password: '83r5^_'));
  });

  setUp(() {
    mockTodoLoginUseCase = MockTodoLoginUseCase();

    authBloc = AuthBloc(mockTodoLoginUseCase);
  });

  const mockAuthResult = LoginEntity(
    accessToken: '12345',
    refreshToken: '67890',
  );

  group('AuthBloc', () {
    group('TodoLoginEvent', () {
      const String username = 'mor_2314';
      const String password = '83r5^_';

      final LoginBody body = LoginBody(
        username: username,
        password: password,
      );

      test('initial state is AuthState.init()', () async {
        expect(authBloc.state, AuthState.init());
      });

      test(
          'emits [AuthState.loading, AuthState.success] when login is successful',
          () {
        when(() => mockTodoLoginUseCase(body)).thenAnswer((_) {
          return Future.value(const Right(mockAuthResult));
        });

        expect(authBloc.state,
            equals(AuthState.init().copyWith(status: AuthStatus.initial)));
      });
    });
  });
}
