import 'package:dartz/dartz.dart';
import 'package:flutter_modular_app/core/error/failures.dart';
import 'package:flutter_modular_app/data/auth/models/models.dart';
import 'package:flutter_modular_app/domain/auth/entities/entities.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginEntity>> requestLogin(LoginBody body);
}
