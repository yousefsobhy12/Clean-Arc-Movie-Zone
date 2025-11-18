import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultTextFormField extends StatefulWidget {
  const DefaultTextFormField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.password = false,
    this.isVisible = false,
    this.readOnly = false,
    this.maxLines = 1,
    this.validator,
    this.onTap,
    this.textInputAction = TextInputAction.done,
    this.onSubmitted,
    this.fillColor,
    this.autoFocus = false,
    this.onChanged,
    this.phoneNumber = false,
    this.isNumeric = false,
    this.errorText,
    this.suffixIcon,
  });

  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final bool readOnly;
  final int maxLines;
  final String? Function(String? value)? validator;
  final void Function()? onTap;
  final TextInputAction textInputAction;
  final void Function(String value)? onSubmitted;
  final Color? fillColor;
  final bool autoFocus;
  final bool password;
  final bool isVisible;
  final bool phoneNumber;
  final bool isNumeric; // Flag to check if this field should accept numbers
  final void Function(String value)? onChanged;
  final String? errorText;
  final Widget? suffixIcon;

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  // bool isVisiblePassword = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapUpOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      focusNode: _focusNode,
      obscureText: widget.password && !widget.isVisible,
      readOnly: widget.readOnly,
      maxLines: widget.maxLines,
      // Decide keyboard type based on phone number or numeric input
      keyboardType: widget.phoneNumber
          ? TextInputType.phone
          : widget.isNumeric
          ? const TextInputType.numberWithOptions(
              decimal: true,
            ) // Numeric with decimals
          : TextInputType.text,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      inputFormatters: widget.phoneNumber
          ? [
              FilteringTextInputFormatter.digitsOnly,
            ] // Only digits for phone number
          : widget.isNumeric
          ? [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
            ] // Allow digits and decimals for weight
          : null,
      autofocus: widget.autoFocus,
      validator: widget.validator,
      textInputAction: widget.textInputAction,
      controller: widget.controller,
      onFieldSubmitted: widget.onSubmitted,
      textAlign: widget.phoneNumber || widget.isNumeric
          ? TextAlign.right
          : TextAlign.start,
      decoration: InputDecoration(
        fillColor: widget.fillColor ?? Colors.grey.shade100,
        filled: true,
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.grey),
        errorText: widget.errorText,
        enabledBorder: outlineInputBorder(borderColor: Colors.transparent),
        focusedBorder: outlineInputBorder(borderColor: Colors.transparent),
        errorBorder: outlineInputBorder(borderColor: Colors.red),
        // prefixIcon: widget.suffixIcon != null
        //     ? SizedBox(
        //         width: 18.w,
        //         height: 18.h,
        //         child: FittedBox(fit: BoxFit.contain, child: widget.suffixIcon),
        //       )
        //     : widget.phoneNumber
        //     ? _buildSuffixIcon()
        //     : widget.isNumeric
        //     ? _buildNumericSuffixIcon()
        //     : null,
        suffixIcon: widget.suffixIcon != null
            ? widget.suffixIcon
            : widget.phoneNumber
            ? _buildSuffixIcon()
            : widget.isNumeric
            ? _buildNumericSuffixIcon()
            : null,
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.phoneNumber) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "+966",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(
              height: 30.h,
              child: const VerticalDivider(color: Colors.grey, thickness: 1),
            ),
          ],
        ),
      );
    }
    return null;
  }

  // Custom suffix for numeric input (e.g., weight)
  Widget? _buildNumericSuffixIcon() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Text(
        "", // Or any other suffix you want to add for weight, for example
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: Colors.grey, fontSize: 16.sp),
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
