import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/usecases/usecase.dart';
import 'package:movie_zone/data/auth/models/signup_req_params.dart';
import 'package:movie_zone/domain/auth/repositories/auth_repo.dart';

class Signup extends UseCase<Either, SignupReqParams> {
  final AuthRepo authRepo;

  Signup({required this.authRepo});
  @override
  Future<Either> call(SignupReqParams params) {
    return authRepo.signup(params);
  }
}
