import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/errors/firebase_errors.dart';
import 'package:movie_zone/domain/auth/entities/user_entity.dart';
import 'package:movie_zone/domain/auth/repositories/auth_repo.dart';

class FirebaseSigninUsecase {
  final AuthRepo authRepo;

  FirebaseSigninUsecase({required this.authRepo});

  Future<Either<FirebaseError, UserEntity>> firebaseSignin(
    String email,
    String password,
  ) async {
    return await authRepo.firebaseSignin(email: email, password: password);
  }
}
