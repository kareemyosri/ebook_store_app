import 'package:book_store_app/core/Theme/styles.dart';
import 'package:book_store_app/core/router/app_route.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(
              context, AppRoute.registerScreen),
          child: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 16, color: AppTheme.kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
