import 'package:flutter/material.dart';
import 'package:movie_zone/common/helper/message/display_message.dart';
import 'package:movie_zone/common/helper/navigation/app_navigation.dart';
import 'package:movie_zone/data/auth/models/signup_req_params.dart';
import 'package:movie_zone/domain/auth/usecases/signup_usecase.dart';
import 'package:movie_zone/presentation/auth/screens/sign_in_screen.dart';
import 'package:movie_zone/presentation/auth/widgets/custom_body_sign_in_and_sign_up_screen.dart';
import 'package:movie_zone/service_locator.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomBodySignAndSignUpScreen(
        email: emailController,
        password: passwordController,
        headerAndButtonTitle: 'Sign Up',
        textSpan1: 'Do you have an account?',
        textSpan2: ' Sign In',
        textSpanOnTap: () {
          AppNavigator.pushReplacement(context, SignInScreen());
        },
        onPressed: () async {
          await serviceLocator<SignupUseCase>().call(
            SignupReqParams(
              email: emailController.text,
              password: passwordController.text,
            ),
          );
        },
        onSuccess: () {},
        onFailure: (error) {
          DisplayMessage.errorMessage(error, context);
        },
      ),
    );
  }
}
