import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_zone/core/constants/api_url.dart';
import 'package:movie_zone/core/network/dio_client.dart';
import 'package:movie_zone/service_locator.dart';

abstract class TvService {
  Future<Either> getPopularTvShows();
  Future<Either> getRecommendedTvShows(int tvShowId);
  Future<Either> getSimilarTvShows(int tvShowId);
}

class TvServiceImpl extends TvService {
  @override
  Future<Either> getPopularTvShows() async {
    try {
      var response = await serviceLocator<DioClient>().get(ApiUrl.popularTvUrl);
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.response!.data['message']);
    }
  }

  @override
  Future<Either> getRecommendedTvShows(int tvShowId) async {
    try {
      var response = await serviceLocator<DioClient>().get(
        '${ApiUrl.tvShows}/$tvShowId/recommendations',
      );
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.response!.data['message']);
    }
  }

  @override
  Future<Either> getSimilarTvShows(int tvShowId) async {
    try {
      var response = await serviceLocator<DioClient>().get(
        '${ApiUrl.tvShows}$tvShowId/similar',
      );
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.response!.data['message']);
    }
  }
}
