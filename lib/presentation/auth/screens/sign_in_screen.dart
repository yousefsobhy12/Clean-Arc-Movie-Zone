import 'package:flutter/material.dart';
import 'package:movie_zone/common/helper/navigation/app_navigation.dart';
import 'package:movie_zone/presentation/auth/screens/sign_up_screen.dart';
import 'package:movie_zone/presentation/auth/widgets/custom_body_sign_in_and_sign_up_screen.dart';

// ignore: must_be_immutable
class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomBodySignAndSignUpScreen(
        email: emailController,
        password: passwordController,
        headerAndButtonTitle: 'Sign In',
        textSpan1: 'Don\'t you have an account?',
        textSpan2: ' Sign Up',
        textSpanOnTap: () {
          AppNavigator.pushReplacement(context, SignUpScreen());
        },
        onPressed: () async {},
        onSuccess: () {},
        onFailure: (failure) {},
      ),
    );
  }
}
