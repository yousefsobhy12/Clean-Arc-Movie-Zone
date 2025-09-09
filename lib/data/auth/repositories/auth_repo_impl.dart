import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/prefs/app_prefs.dart';
import 'package:movie_zone/data/auth/models/signin_req_params.dart';
import 'package:movie_zone/data/auth/models/signup_req_params.dart';
import 'package:movie_zone/data/auth/sources/auth_service.dart';
import 'package:movie_zone/domain/auth/repositories/auth_repo.dart';
import 'package:movie_zone/service_locator.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthService authApiService;

  AuthRepoImpl({required this.authApiService});
  @override
  Future<Either<String, Map<String, dynamic>>> signup(
    SignupReqParams params,
  ) async {
    var data = await serviceLocator.get<AuthService>().signup(params);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        await AppPrefs.saveString('token', data['user']['token']);
        return Right(data);
      },
    );
  }

  @override
  Future<Either<String, Map<String, dynamic>>> signin(
    SigninReqParams params,
  ) async {
    var data = await serviceLocator.get<AuthService>().signin(params);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        await AppPrefs.saveString('token', data['user']['token']);
        return Right(data);
      },
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    var token = AppPrefs.getString('token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }
}
