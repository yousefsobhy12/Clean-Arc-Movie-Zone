import 'package:dartz/dartz.dart';
import 'package:movie_zone/data/auth/models/signin_req_params.dart';
import 'package:movie_zone/data/auth/models/signup_req_params.dart';

abstract class AuthRepo {
  Future<Either<dynamic,dynamic>> signup(SignupReqParams params);
  Future<Either<dynamic,dynamic>> signin(SigninReqParams params);
}
