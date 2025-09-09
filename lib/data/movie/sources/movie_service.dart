import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_zone/core/constants/api_url.dart';
import 'package:movie_zone/core/network/dio_client.dart';
import 'package:movie_zone/service_locator.dart';

abstract class MovieService {
  Future<Either> getTrendingMovies();
}

class MovieServiceImpl extends MovieService {
  @override
  Future<Either> getTrendingMovies() async {
    try {
      var response = await serviceLocator<DioClient>().get(ApiUrl.trendingUrl);
      return Right(response.data);
    } on DioException catch (error) {
      final message =
          error.response?.data?['message']?.toString() ?? 'Unknown error';
      return Left(message);
    } catch (error) {
      return Left('Unexpected error: $error');
    }
  }
}
