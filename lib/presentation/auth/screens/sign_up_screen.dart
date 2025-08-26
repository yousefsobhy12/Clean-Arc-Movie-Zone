import 'package:flutter/material.dart';
import 'package:movie_zone/common/helper/navigation/app_navigation.dart';
import 'package:movie_zone/presentation/auth/screens/sign_in_screen.dart';
import 'package:movie_zone/presentation/auth/widgets/custom_body_sign_in_and_sign_up_screen.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomBodySignAndSignUpScreen(
        email: email,
        password: password,
        headerAndButtonTitle: 'Sign Up',
        textSpan1: 'Do you have an account?',
        textSpan2: ' Sign In',
        textSpanOnTap: () {
          AppNavigator.pushReplacement(context, SignInScreen());
        },
      ),
    );
  }
}
