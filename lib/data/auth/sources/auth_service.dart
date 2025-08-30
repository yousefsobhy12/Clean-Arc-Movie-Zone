import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_zone/core/constants/api_url.dart';
import 'package:movie_zone/core/network/dio_client.dart';
import 'package:movie_zone/data/auth/models/signup_req_params.dart';
import 'package:movie_zone/service_locator.dart';

abstract class AuthService {
  Future<Either> signup(SignupReqParams params);
}

class AuthServiceImpl extends AuthService {
  @override
  Future<Either> signup(SignupReqParams params) async {
    try {
      var response = await serviceLocator<DioClient>().post(
        ApiUrl.signupUrl,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response?.data?['message'] ?? 'Unknown error');
    }
  }
}
