part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class UnAuthenticated extends SplashState {}

final class Authenticated extends SplashState {}
