import 'package:auth/src/data/models/models.dart';
import 'package:auth/src/domain/entities/entities.dart';
import 'package:auth/src/domain/repositories/repository.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase extends UseCase<LoginEntity, LoginBody> {
  LoginUsecase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, LoginEntity>> call(LoginBody params) {
    return _repository.requestLogin(params);
  }
}
