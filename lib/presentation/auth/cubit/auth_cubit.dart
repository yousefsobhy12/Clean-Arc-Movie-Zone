import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/data/auth/repositories/auth_repo_impl.dart';
import 'package:movie_zone/data/auth/sources/auth_service.dart';
import 'package:movie_zone/domain/auth/entities/user_entity.dart';
import 'package:movie_zone/domain/auth/usecases/firebase_signin_usecase.dart';
import 'package:movie_zone/domain/auth/usecases/firebase_signup_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()) {
    log("SIGNUP CUBIT CREATED");
  }

  @override
  Future<void> close() {
    log("SIGNUP CUBIT CLOSED");
    return super.close();
  }
  void firebaseSignup({
    required String name,
    required String email,
    required String password,
  }) async {
    var returnedData = await FirebaseSignupUsecase(
      authRepo: AuthRepoImpl(authApiService: AuthApiServiceImpl()),
    ).firebaseSignup(name, email, password);

    returnedData.fold(
      (error) {
        return emit(SignupFailed(errorMessage: error.toString()));
      },
      (user) {
        return emit(SignupSuccess(user: user));
      },
    );
  }

  void firebaseSignin({required String email, required String password}) async {
    var returnedData = await FirebaseSigninUsecase(
      authRepo: AuthRepoImpl(authApiService: AuthApiServiceImpl()),
    ).firebaseSignin(email, password);

    returnedData.fold(
      (error) {
        return emit(SigninFailed(errorMessage: error.toString()));
      },
      (user) {
        return emit(SigninSuccess(user: user));
      },
    );
  }
}
