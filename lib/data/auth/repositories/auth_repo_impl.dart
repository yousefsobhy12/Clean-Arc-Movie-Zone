import 'package:dartz/dartz.dart';
import 'package:movie_zone/data/auth/models/signin_req_params.dart';
import 'package:movie_zone/data/auth/models/signup_req_params.dart';
import 'package:movie_zone/data/auth/sources/auth_service.dart';
import 'package:movie_zone/domain/auth/repositories/auth_repo.dart';
import 'package:movie_zone/service_locator.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthApiService authApiService;

  AuthRepoImpl({required this.authApiService});
  @override
  Future<Either<dynamic, dynamic>> signup(SignupReqParams params) async {
    return await serviceLocator.get<AuthApiService>().signup(params);
  }

  @override
  Future<Either<dynamic, dynamic>> signin(SigninReqParams params) async {
    return await serviceLocator.get<AuthApiService>().signin(params);
  }
}
