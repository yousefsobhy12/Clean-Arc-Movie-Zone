import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/errors/firebase_errors.dart';
import 'package:movie_zone/data/auth/models/signin_req_params.dart';
import 'package:movie_zone/data/auth/models/signup_req_params.dart';
import 'package:movie_zone/domain/auth/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<String, Map<String, dynamic>>> signup(SignupReqParams params);
  Future<Either<String, Map<String, dynamic>>> signin(SigninReqParams params);
  Future<bool> isLoggedIn();
  Future<Either<FirebaseError, UserEntity>> firebaseSignup({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<FirebaseError, UserEntity>> firebaseSignin({
    required String email,
    required String password,
  });
}
