import 'package:fakestore/app/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthEvent', () {
    const username = 'testuser';
    const password = 'passusers';
    group('TodoLoginEvent', () {
      test('supports value equality', () {
        expect(
          const TodoLoginEvent(username: username, password: password),
          const TodoLoginEvent(username: username, password: password),
        );
      });

      test('props are correct', () {
        expect(
          const TodoLoginEvent(username: username, password: password).props,
          equals([username, password]),
        );
      });
    });
  });
}
