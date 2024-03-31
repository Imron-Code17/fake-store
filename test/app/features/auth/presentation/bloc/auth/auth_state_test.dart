import 'package:fakestore/app/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthState', () {
    group('AuthState, initial', () {
      AuthState createSubjectInitial() {
        return const AuthState(
            status: AuthStatus.initial, username: '', password: '');
      }

      test('support value equality', () {
        expect(createSubjectInitial(), equals(createSubjectInitial()));
      });

      test('propos are correct [initial]', () {
        expect(createSubjectInitial().props,
            equals(<Object?>[AuthStatus.initial, '', '']));
      });
    });

    group('AuthState , success', () {
      AuthState createSubjectSuccess() {
        return const AuthState(
          status: AuthStatus.success,
          username: 'testuser',
          password: 'passtestuser',
        );
      }

      test('return a valid AuthState', () {
        expect(createSubjectSuccess(), createSubjectSuccess());
      });

      test('propos are correct [success]', () {
        expect(createSubjectSuccess().props,
            equals(<Object?>[AuthStatus.success, 'testuser', 'passtestuser']));
      });
    });
  });
}
