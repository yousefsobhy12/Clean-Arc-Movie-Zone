import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_zone/core/constants/api_url.dart';
import 'package:movie_zone/core/network/dio_client.dart';
import 'package:movie_zone/service_locator.dart';

abstract class AuthService {
  Future<Either> signup();
}

class AuthServiceImpl extends AuthService {
  @override
  Future<Either> signup() async {
    try {
      var response = await serviceLocator<DioClient>().post(ApiUrl.signupUrl);
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
