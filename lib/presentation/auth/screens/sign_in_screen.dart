import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/common/helper/navigation/app_navigation.dart';
import 'package:movie_zone/common/widgets/default_text_form_field.dart';
import 'package:movie_zone/core/configs/theme/app_colors.dart';
import 'package:movie_zone/presentation/auth/cubit/auth_cubit.dart';
import 'package:movie_zone/presentation/auth/screens/sign_up_screen.dart';
import 'package:movie_zone/presentation/auth/widgets/custom_body_sign_in_and_sign_up_screen.dart';
import 'package:movie_zone/presentation/main/screens/main_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            log("STATE => $state");
            if (state is SigninSuccess) {
              log("NAVIGATE NOW TO HOME SCREEN");
              AppNavigator.pushReplacement(context, const MainScreen());
            } else if (state is SigninFailed) {
              log("FAILED: ${state.errorMessage}");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: CustomBodySignAndSignUpScreen(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.25),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(124, 0, 0, 0),
                          offset: Offset(0, 10),
                          spreadRadius: 70,
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.09,
                            ),
                            const Text(
                              'Sign In',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 40),
                            DefaultTextFormField(
                              hint: 'Email',
                              controller: emailController,
                              fillColor: const Color(0xff2B2B2B),
                            ),
                            const SizedBox(height: 20),
                            DefaultTextFormField(
                              hint: 'Password',
                              controller: passwordController,
                              fillColor: const Color(0xff2B2B2B),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                icon: Icon(
                                  isVisible
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: AppColors.primary,
                                ),
                              ),
                              password: true,
                              isVisible: isVisible,
                            ),
                            const SizedBox(height: 30),
                            Builder(
                              builder: (BuildContext context) { return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                  ),
                                ),
                                onPressed: () {
                                  context.read<AuthCubit>().firebaseSignin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                },
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ); },
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.22,
                            ),
                            InkWell(
                              onTap: () {
                                AppNavigator.pushReplacement(
                                  context,
                                  const SignUpScreen(),
                                );
                              },
                              child: const Text.rich(
                                textAlign: TextAlign.center,
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Don\'t you have an account?',
                                    ),
                                    TextSpan(
                                      text: ' Sign Up',
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
