import 'package:get_it/get_it.dart';
import 'package:movie_zone/core/network/dio_client.dart';
import 'package:movie_zone/data/auth/repositories/auth_repo_impl.dart';
import 'package:movie_zone/data/auth/sources/auth_service.dart';
import 'package:movie_zone/domain/auth/repositories/auth_repo.dart';
import 'package:movie_zone/domain/auth/usecases/signup_usecase.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // Dio client
  serviceLocator.registerSingleton<DioClient>(DioClient());

  // Services
  serviceLocator.registerSingleton<AuthService>(AuthServiceImpl());

  // Repositories
  serviceLocator.registerSingleton<AuthRepo>(AuthRepoImpl());

  // Use Case
  serviceLocator.registerSingleton<SignupUseCase>(SignupUseCase());
}
