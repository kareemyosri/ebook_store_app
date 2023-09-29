import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  static const primaryColor = Color(0xFFFF7643);
  static const kPrimaryLightColor = Color(0xFFFFECDF);
  static const blackColor = Color(0xFF030E19);

  static Color greyColor = const Color(0xff030e19b2);
  static const kPrimaryColor = Color(0xFFFF7643);
  static const kPrimaryGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
  );
  static const kSecondaryColor = Color(0xFF979797);
  static const kTextColor = Color(0xFF757575);

  static const kAnimationDuration = Duration(milliseconds: 200);

  static const headingStyle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    height: 1.5,
  );

  static const defaultDuration = Duration(milliseconds: 250);

// Form Error
  final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static const String kEmailNullError = "Please Enter your email";
  static const String kInvalidEmailError = "Please Enter Valid Email";
  static const String kPassNullError = "Please Enter your password";
  static const String kShortPassError = "Password is too short";
  static const String kMatchPassError = "Passwords don't match";
  static const String kNamelNullError = "Please Enter your name";
  static const String kPhoneNumberNullError = "Please Enter your phone number";
  static const String kAddressNullError = "Please Enter your address";

  final otpInputDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 15.w),
    border: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
    enabledBorder: outlineInputBorder(),
  );

  static OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.w),
      borderSide: const BorderSide(color: kTextColor),
    );
  }
}
