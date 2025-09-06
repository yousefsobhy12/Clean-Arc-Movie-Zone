import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/usecases/usecase.dart';
import 'package:movie_zone/data/auth/models/signin_req_params.dart';
import 'package:movie_zone/domain/auth/repositories/auth_repo.dart';

class SigninUsecase extends UseCase<Either<dynamic, dynamic>, SigninReqParams> {
  final AuthRepo authRepo;

  SigninUsecase({required this.authRepo});
  @override
  Future<Either<dynamic, dynamic>> call(SigninReqParams params) {
    return authRepo.signin(params);
  }
}
