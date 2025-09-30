import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:movie_zone/common/helper/navigation/app_navigation.dart';
import 'package:movie_zone/presentation/auth/screens/sign_in_screen.dart';
import 'package:movie_zone/presentation/home/screens/home_screen.dart';

class DisplayMessage {
  static void handleAuthResult<L, R>(
    Either<L, R> result,
    BuildContext context, {
    bool isSignUp = false,
    void Function(L error)? onError,
    void Function(R data)? onSuccess,
  }) {
    result.fold(
      (error) {
        debugPrint("❌ Error runtimeType: ${error.runtimeType}, value: $error");
        if (onError != null) {
          onError(error);
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(error.toString())));
        }
      },
      (data) {
        debugPrint("✅ Data runtimeType: ${data.runtimeType}, value: $data");
        if (onSuccess != null) {
          onSuccess(data);
        } else {
          if (isSignUp) {
            AppNavigator.pushReplacement(context, SignInScreen());
          } else {
            AppNavigator.pushReplacement(context, const HomeScreen());
          }
        }
      },
    );
  }
}
