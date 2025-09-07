import 'package:flutter/material.dart';
import 'package:movie_zone/common/helper/message/display_message.dart';
import 'package:movie_zone/common/helper/navigation/app_navigation.dart';
import 'package:movie_zone/data/auth/models/signin_req_params.dart';
import 'package:movie_zone/domain/auth/usecases/signin_usecase.dart';
import 'package:movie_zone/presentation/auth/screens/sign_up_screen.dart';
import 'package:movie_zone/presentation/auth/widgets/custom_body_sign_in_and_sign_up_screen.dart';
import 'package:movie_zone/service_locator.dart';

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
        onPressed: () async {
          final result = await serviceLocator<SigninUsecase>().call(
            SigninReqParams(
              email: emailController.text,
              password: passwordController.text,
            ),
          );
          // ignore: use_build_context_synchronously
          DisplayMessage.handleAuthResult(result, context);
        },
      ),
    );
  }
}
