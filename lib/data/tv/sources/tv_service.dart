import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_zone/core/constants/api_url.dart';
import 'package:movie_zone/core/network/dio_client.dart';
import 'package:movie_zone/service_locator.dart';

abstract class TvService {
  Future<Either> getPopularTv();
}

class TvServiceImpl extends TvService {
  @override
  Future<Either> getPopularTv() async {
    try {
      var response = await serviceLocator<DioClient>().get(ApiUrl.popularTvUrl);
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.response!.data['message']);
    }
  }
}
