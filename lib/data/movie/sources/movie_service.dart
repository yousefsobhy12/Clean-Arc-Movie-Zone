import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_zone/core/constants/api_url.dart';
import 'package:movie_zone/core/network/dio_client.dart';
import 'package:movie_zone/service_locator.dart';

abstract class MovieService {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
  Future<Either> getMovieTrailer(int movieId);
  Future<Either> getRecommendedMovies(int movieId);
  Future<Either> getSimilarMovies(int movieId);
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

  @override
  Future<Either> getNowPlayingMovies() async {
    try {
      var response = await serviceLocator<DioClient>().get(
        ApiUrl.nowPlayingUrl,
      );
      return Right(response.data);
    } on DioException catch (error) {
      final message =
          error.response?.data?['message']?.toString() ?? 'Unknown error';
      return Left(message);
    } catch (error) {
      return Left('Unexpected error: $error');
    }
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    try {
      var response = await serviceLocator<DioClient>().get(
        '${ApiUrl.movieUrl}$movieId/trailer',
      );
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.response!.data['message']);
    }
  }

  @override
  Future<Either> getRecommendedMovies(int movieId) async {
    try {
      var response = await serviceLocator<DioClient>().get(
        '${ApiUrl.movieUrl}+$movieId/recommendations',
      );
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.response!.data['message']);
    }
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async {
    try {
      var response = await serviceLocator<DioClient>().get(
        '${ApiUrl.movieUrl}$movieId/similar',
      );
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.response!.data['message']);
    }
  }
}
