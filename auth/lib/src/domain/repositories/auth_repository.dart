import 'package:auth/src/data/models/models.dart';
import 'package:auth/src/domain/entities/entities.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> requestLogin(LoginBody body);
}
