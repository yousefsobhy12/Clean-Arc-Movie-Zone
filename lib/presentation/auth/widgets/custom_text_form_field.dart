import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    // required this.title,
    this.suffixIcon,
    required this.controller,
    this.validator,
  });
  // final String title;
  final String hintText;
  IconButton? suffixIcon;
  final TextEditingController controller;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapUpOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        suffixIcon:
            suffixIcon ?? const Icon(Icons.abc, color: Colors.transparent),
        suffixIconColor: Colors.grey,
        enabledBorder: outlineInputBorder(borderColor: Colors.transparent),
        focusedBorder: outlineInputBorder(borderColor: Colors.transparent),
        errorBorder: outlineInputBorder(borderColor: Colors.red),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder({required Color borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: borderColor),
    );
  }
}
