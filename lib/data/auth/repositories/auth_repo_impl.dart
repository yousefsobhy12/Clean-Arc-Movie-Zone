import 'package:dartz/dartz.dart';
import 'package:movie_zone/data/auth/models/signup_req_params.dart';
import 'package:movie_zone/data/auth/sources/auth_service.dart';
import 'package:movie_zone/domain/auth/repositories/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthService authService;

  AuthRepoImpl({required this.authService});
  @override
  Future<Either> signup(SignupReqParams params) async {
    return await authService.signup(params);
  }
}
