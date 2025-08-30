import 'package:flutter/material.dart';
import 'package:movie_zone/core/configs/assets/app_images.dart';
import 'package:movie_zone/core/configs/theme/app_colors.dart';
import 'package:movie_zone/presentation/auth/widgets/custom_text_form_field.dart';
import 'package:reactive_button/reactive_button.dart';

// ignore: must_be_immutable
class CustomBodySignAndSignUpScreen extends StatelessWidget {
  CustomBodySignAndSignUpScreen({
    super.key,
    this.textSpanOnTap,
    required this.onPressed,
    required this.onSuccess,
    required this.onFailure,
    required this.email,
    required this.password,
    required this.headerAndButtonTitle,
    required this.textSpan1,
    required this.textSpan2,
  });

  final TextEditingController email;
  final TextEditingController password;
  final String headerAndButtonTitle;
  final String textSpan1;
  final String textSpan2;
  void Function()? textSpanOnTap;
  Future<dynamic> Function() onPressed;
  void Function() onSuccess;
  dynamic Function(String) onFailure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AppImages.splashBackground),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.25),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(124, 0, 0, 0),
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
                      Text(
                        headerAndButtonTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 40),
                      CustomTextFormField(hintText: 'Email', controller: email),
                      SizedBox(height: 20),
                      CustomTextFormField(
                        hintText: 'Password',
                        controller: password,
                      ),
                      SizedBox(height: 50),
                      ReactiveButton(
                        title: headerAndButtonTitle,
                        activeColor: AppColors.primary,
                        onPressed: onPressed,
                        onSuccess: onSuccess,
                        onFailure: onFailure,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.22,
                      ),
                      InkWell(
                        onTap: textSpanOnTap,
                        child: Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            children: [
                              TextSpan(text: textSpan1),
                              TextSpan(
                                text: textSpan2,
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
    );
  }
}
