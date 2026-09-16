import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../feautures/auth/data/dataSource/auth_remote_data_source.dart';
import '../../feautures/auth/data/repository/auth_repository.dart';
import '../network/api_client.dart';
import '../storage/token_storage.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton(() => const FlutterSecureStorage());
  getIt.registerLazySingleton(() => TokenStorage(getIt()));
  getIt.registerLazySingleton(() => ApiClient(getIt()));

  getIt.registerLazySingleton(() => AuthRemoteDataSource(getIt()));
  getIt.registerLazySingleton(() => AuthRepository(getIt(), getIt()));
}