import 'package:flutter/material.dart';
import 'package:movie_zone/common/widgets/default_text_form_field.dart';
import 'package:movie_zone/core/configs/assets/app_images.dart';
import 'package:movie_zone/core/configs/theme/app_colors.dart';

// ignore: must_be_immutable
class CustomBodySignAndSignUpScreen extends StatefulWidget {
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
  State<CustomBodySignAndSignUpScreen> createState() =>
      _CustomBodySignAndSignUpScreenState();
}

class _CustomBodySignAndSignUpScreenState
    extends State<CustomBodySignAndSignUpScreen> {
  bool isVisible = false;

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
                        widget.headerAndButtonTitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 40),
                      // CustomTextFormField(hintText: 'Email', controller: email),
                      DefaultTextFormField(
                        hint: 'Email',
                        controller: widget.email,
                        fillColor: const Color(0xff2B2B2B),
                      ),
                      const SizedBox(height: 20),
                      DefaultTextFormField(
                        hint: 'Password',
                        controller: widget.password,
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                        ),
                        onPressed: widget.onPressed,
                        child: Text(widget.headerAndButtonTitle),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.22,
                      ),
                      InkWell(
                        onTap: widget.textSpanOnTap,
                        child: Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            children: [
                              TextSpan(text: widget.textSpan1),
                              TextSpan(
                                text: widget.textSpan2,
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
