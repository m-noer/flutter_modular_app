import 'package:dartz/dartz.dart';
import 'package:flutter_modular_app/core/error/failures.dart';
import 'package:flutter_modular_app/core/usecases/usecase.dart';
import 'package:flutter_modular_app/data/auth/models/models.dart';
import 'package:flutter_modular_app/domain/auth/entities/entities.dart';
import 'package:flutter_modular_app/domain/auth/repositories/repository.dart';

class LoginUsecase extends UseCase<LoginEntity, LoginBody> {
  LoginUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, LoginEntity>> call(LoginBody params) {
    return _repository.requestLogin(params);
  }
}
