import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/Theme/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final bool obscureText;
  final Color? errorColor;
  final AutovalidateMode? autoValidateMode;
  final String? errorText;
  final int? maxLines;

  const CustomTextFormField(
      {super.key,
      required this.controller,
      this.keyboardType,
      this.prefixIcon,
      this.suffixIcon,
      required this.hintText,
      this.labelText,
      this.validator,
      this.onTap,
      this.prefixIconColor,
      this.suffixIconColor,
      this.obscureText = false,
      this.errorColor,
      this.autoValidateMode,
      this.errorText,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      autovalidateMode: autoValidateMode,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onTap: onTap,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppTheme.kTextColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppTheme.kTextColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppTheme.kTextColor),
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor,
        hintText: hintText,
        hintStyle: GoogleFonts.roboto(
          color: AppTheme.blackColor,
          fontSize: 13.5.sp,
          fontWeight: FontWeight.w400,
        ),
        errorText: errorText,
        errorStyle: TextStyle(
          color: errorColor,
          fontSize: 13.5.sp,
          fontFamily: 'SFProDisplay',
          fontWeight: FontWeight.w400,
        ),
        labelText: labelText,
      ),
    );
  }
}
