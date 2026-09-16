import 'package:get_it/get_it.dart';

import '../../feautures/auth/data/dataSource/auth_remote_data_source.dart';
import '../../feautures/auth/data/repository/auth_repository.dart';
import '../network/api_client.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton(() => AuthRemoteDataSource(ApiClient.instance));
  getIt.registerLazySingleton(() => AuthRepository(getIt(), getIt()));
}