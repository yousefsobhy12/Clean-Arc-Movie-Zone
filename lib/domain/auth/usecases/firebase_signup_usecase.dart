import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/errors/firebase_errors.dart';
import 'package:movie_zone/domain/auth/entities/user_entity.dart';
import 'package:movie_zone/domain/auth/repositories/auth_repo.dart';

class FirebaseSignupUsecase {
  final AuthRepo authRepo;

  FirebaseSignupUsecase({required this.authRepo});

  Future<Either<FirebaseError, UserEntity>> firebaseSignup(
    String name,
    String email,
    String password,
  ) async {
    return await authRepo.firebaseSignup(
      name: name,
      email: email,
      password: password,
    );
  }
}
