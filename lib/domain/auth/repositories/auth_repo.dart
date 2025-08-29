import 'package:dartz/dartz.dart';
import 'package:movie_zone/data/auth/models/signup_req_params.dart';

abstract class AuthRepo {
  Future<Either> signup(SignupReqParams params);
}
