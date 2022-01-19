import 'package:auth/src/data/datasources/auth_local_data_source.dart';
import 'package:auth/src/data/datasources/auth_remote_data_source.dart';
import 'package:auth/src/data/repositories/repository_impl.dart';
import 'package:auth/src/domain/repositories/repository.dart';
import 'package:auth/src/domain/usecases/usecase.dart';
import 'package:auth/src/presentation/blocs/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Auth
  // Bloc
  sl.registerFactory(() => AuthBloc(sl()));

  // Use cases
  sl.registerLazySingleton(() => LoginUsecase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl(), sl()));

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sl()));
}
