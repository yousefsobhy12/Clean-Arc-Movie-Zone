import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_zone/core/constants/api_url.dart';
import 'package:movie_zone/core/network/dio_client.dart';
import 'package:movie_zone/data/auth/models/signin_req_params.dart';
import 'package:movie_zone/data/auth/models/signup_req_params.dart';
import 'package:movie_zone/service_locator.dart';

abstract class AuthApiService {
  Future<Either<dynamic, dynamic>> signup(SignupReqParams params);
  Future<Either<dynamic, dynamic>> signin(SigninReqParams params);
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either<String, dynamic>> signup(SignupReqParams params) async {
    try {
      var response = await serviceLocator<DioClient>().post(
        ApiUrl.signupUrl,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      final message =
          e.response?.data?['message']?.toString() ?? 'Unknown error';
      return Left(message);
    }
  }

  @override
  Future<Either<String, dynamic>> signin(SigninReqParams params) async {
    try {
      var response = await serviceLocator<DioClient>().post(
        ApiUrl.signinUrl,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      final message =
          e.response?.data?['message']?.toString() ?? 'Unknown error';
      return Left(message);
    }
  }
}
// class AuthApiServiceImpl extends AuthApiService {
//   @override
//   Future<Either<dynamic,dynamic>> signup(SignupReqParams params) async {
//     try {
//       var response = await serviceLocator<DioClient>().post(
//         ApiUrl.signupUrl,
//         data: params.toMap(),
//       );
//       return Right(response.data);
//     } on DioException catch (e) {
//       return Left(e.response?.data?['message'] ?? 'Unknown error');
//     }
//   }

//   @override
//   Future<Either<dynamic,dynamic>> signin(SigninReqParams params) async {
//     try {
//       var response = await serviceLocator<DioClient>().post(
//         ApiUrl.signinUrl,
//         data: params.toMap(),
//       );
//       return Right(response.data);
//     } on DioException catch (e) {
//       return Left(e.response?.data?['message'] ?? 'Unknown error');
//     }
//   }
// }
