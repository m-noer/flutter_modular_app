import 'package:core/core.dart';

abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl(this.sharedPrefs);

  final SharedPrefs sharedPrefs;

  @override
  Future<void> saveToken(String token) {
    return sharedPrefs.putString('keyAccessToken', token);
  }
}
