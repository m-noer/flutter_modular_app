import 'dart:developer';

import 'package:auth/src/constants/api_path.dart';
import 'package:auth/src/data/models/models.dart';
import 'package:auth/src/domain/entities/entities.dart';
import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<LoginEntity> requestLogin(LoginBody body);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._client);

  final Dio _client;

  @override
  Future<LoginEntity> requestLogin(LoginBody body) async {
    try {
      final _response = await _client.post<Map<String, dynamic>>(
        ApiPath.login,
        data: body.toJson(),
      );

      return LoginModel.fromJson(_response.data!);
    } on DioError catch (e) {
      log(e.message);
      throw DioError(
        requestOptions: e.requestOptions,
        error: e.error,
        response: e.response,
      );
    }
  }
}
