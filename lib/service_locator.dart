import 'package:get_it/get_it.dart';
import 'package:movie_zone/core/network/dio_client.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerSingleton<DioClient>(DioClient());
}
