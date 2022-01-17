import 'package:flutter_modular_app/core/error/failures.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Failure', () {
    group('ServerFailure', () {
      test('return correct props', () {
        expect(const ServerFailure('server fail').props, ['server fail']);
      });
    });
  });
}
