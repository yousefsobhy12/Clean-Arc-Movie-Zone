part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

// Sign in states
final class SigninSuccess extends AuthState {
  final UserEntity user;

  SigninSuccess({required this.user});
}

final class SigninFailed extends AuthState {
  final String errorMessage;

  SigninFailed({required this.errorMessage});
}


// Sign up states
final class SignupSuccess extends AuthState {
  final UserEntity user;

  SignupSuccess({required this.user});
}

final class SignupFailed extends AuthState {
  final String errorMessage;

  SignupFailed({required this.errorMessage});
}
