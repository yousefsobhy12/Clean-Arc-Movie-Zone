import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    required this.controller,
    this.validator,
  });
  final String hintText;
  IconButton? suffixIcon;
  final TextEditingController controller;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
        suffixIcon: suffixIcon ?? Icon(Icons.abc, color: Colors.transparent),
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
