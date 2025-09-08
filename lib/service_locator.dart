import 'package:get_it/get_it.dart';
import 'package:movie_zone/core/network/dio_client.dart';
import 'package:movie_zone/data/auth/repositories/auth_repo_impl.dart';
import 'package:movie_zone/data/auth/sources/auth_service.dart';
import 'package:movie_zone/domain/auth/repositories/auth_repo.dart';
import 'package:movie_zone/domain/auth/usecases/is_logged_in_usecase.dart';
import 'package:movie_zone/domain/auth/usecases/signin_usecase.dart';
import 'package:movie_zone/domain/auth/usecases/signup_usecase.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // Dio client
  serviceLocator.registerLazySingleton<DioClient>(() => DioClient());

  // Services
  serviceLocator.registerLazySingleton<AuthApiService>(
    () => AuthApiServiceImpl(),
  );

  // Repositories
  serviceLocator.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authApiService: serviceLocator()),
  );

  // Use Cases
  serviceLocator.registerLazySingleton<SignupUseCase>(
    () => SignupUseCase(authRepo: serviceLocator()),
  );

  serviceLocator.registerLazySingleton<SigninUsecase>(
    () => SigninUsecase(authRepo: serviceLocator()),
  );
  serviceLocator.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());
}
