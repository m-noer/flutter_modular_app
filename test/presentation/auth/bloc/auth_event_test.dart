import 'package:flutter_modular_app/data/auth/models/models.dart';
import 'package:flutter_modular_app/presentation/auth/blocs/auth_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthEvent', () {
    group('LoginEvent', () {
      const loginBody = LoginBody(username: 'username', password: 'password');
      test('return correct props', () {
        expect(const LoginEvent(loginBody).props, [loginBody]);
      });
    });
  });
}
