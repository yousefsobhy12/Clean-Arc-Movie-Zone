import 'package:get_it/get_it.dart';
import 'package:movie_zone/core/network/dio_client.dart';
import 'package:movie_zone/data/auth/repositories/auth_repo_impl.dart';
import 'package:movie_zone/data/auth/sources/auth_service.dart';
import 'package:movie_zone/data/movie/repositories/movie_repo_impl.dart';
import 'package:movie_zone/data/movie/sources/movie_service.dart';
import 'package:movie_zone/data/tv/repositories/tv_repo_impl.dart';
import 'package:movie_zone/data/tv/sources/tv_service.dart';
import 'package:movie_zone/domain/auth/repositories/auth_repo.dart';
import 'package:movie_zone/domain/auth/usecases/is_logged_in_usecase.dart';
import 'package:movie_zone/domain/auth/usecases/signin_usecase.dart';
import 'package:movie_zone/domain/auth/usecases/signup_usecase.dart';
import 'package:movie_zone/domain/movie/repositories/movie_repo.dart';
import 'package:movie_zone/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:movie_zone/domain/movie/usecases/get_trending_movies.dart';
import 'package:movie_zone/domain/tv/repositories/tv_repo.dart';
import 'package:movie_zone/domain/tv/usecases/tv_usecase.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // Dio client
  serviceLocator.registerLazySingleton<DioClient>(() => DioClient());

  // Services
  serviceLocator.registerLazySingleton<AuthService>(() => AuthApiServiceImpl());
  serviceLocator.registerSingleton<MovieService>(MovieServiceImpl());
  serviceLocator.registerSingleton<TvService>(TvServiceImpl());

  // Repositories
  serviceLocator.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authApiService: serviceLocator()),
  );
  serviceLocator.registerSingleton<MovieRepo>(MovieRepoImpl());
  serviceLocator.registerSingleton<TvRepo>(TvRepoImpl());

  // Use Cases
  serviceLocator.registerLazySingleton<SignupUseCase>(
    () => SignupUseCase(authRepo: serviceLocator()),
  );

  serviceLocator.registerLazySingleton<SigninUsecase>(
    () => SigninUsecase(authRepo: serviceLocator()),
  );
  serviceLocator.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());
  serviceLocator.registerSingleton<GetTrendingMoviesUseCase>(
    GetTrendingMoviesUseCase(),
  );
  serviceLocator.registerSingleton<GetNowPlayingMovies>(GetNowPlayingMovies());
  serviceLocator.registerSingleton<GetPopularTvUsecase>(GetPopularTvUsecase());
}
