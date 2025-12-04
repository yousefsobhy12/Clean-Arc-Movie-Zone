import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/common/helper/navigation/app_navigation.dart';
import 'package:movie_zone/common/widgets/default_text_form_field.dart';
import 'package:movie_zone/core/configs/theme/app_colors.dart';
import 'package:movie_zone/presentation/auth/cubit/auth_cubit.dart';
import 'package:movie_zone/presentation/auth/screens/sign_in_screen.dart';
import 'package:movie_zone/presentation/auth/widgets/custom_body_sign_in_and_sign_up_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
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
            if (state is SignupSuccess) {
              log("NAVIGATE NOW");
              AppNavigator.pushReplacement(context, const SignInScreen());
            } else if (state is SignupFailed) {
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
                              'Sign Up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 40),
                            DefaultTextFormField(
                              hint: 'Name',
                              controller: nameController,
                              fillColor: const Color(0xff2B2B2B),
                            ),
                            const SizedBox(height: 20),
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
                              builder: (context) {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20,
                                    ),
                                  ),
                                  onPressed: () {
                                    context.read<AuthCubit>().firebaseSignup(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  },
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.15,
                            ),
                            InkWell(
                              onTap: () {
                                AppNavigator.pushReplacement(
                                  context,
                                  const SignInScreen(),
                                );
                              },
                              child: const Text.rich(
                                textAlign: TextAlign.center,
                                TextSpan(
                                  children: [
                                    TextSpan(text: 'Do you have an account?'),
                                    TextSpan(
                                      text: ' Sign In',
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

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
