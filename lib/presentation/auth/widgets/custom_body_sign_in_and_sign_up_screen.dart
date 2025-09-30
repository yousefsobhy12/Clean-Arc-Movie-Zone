import 'package:flutter/material.dart';
import 'package:movie_zone/core/configs/assets/app_images.dart';
import 'package:movie_zone/core/configs/theme/app_colors.dart';
import 'package:movie_zone/presentation/auth/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class CustomBodySignAndSignUpScreen extends StatelessWidget {
  CustomBodySignAndSignUpScreen({
    super.key,
    this.textSpanOnTap,
    required this.onPressed,
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
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
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
                      Text(
                        headerAndButtonTitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 40),
                      CustomTextFormField(hintText: 'Email', controller: email),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        hintText: 'Password',
                        controller: password,
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                        ),
                        onPressed: onPressed,
                        child: Text(headerAndButtonTitle),
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
                                style: const TextStyle(
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
