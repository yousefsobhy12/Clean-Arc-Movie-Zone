import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/usecases/usecase.dart';
import 'package:movie_zone/data/auth/models/signup_req_params.dart';
import 'package:movie_zone/domain/auth/repositories/auth_repo.dart';

class SignupUseCase extends UseCase<Either<dynamic, dynamic>, SignupReqParams> {
  final AuthRepo authRepo;
  SignupUseCase({required this.authRepo});

  @override
  Future<Either<dynamic, dynamic>> call(SignupReqParams params) {
    return authRepo.signup(params);
  }
}
