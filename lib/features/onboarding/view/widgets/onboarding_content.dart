import 'package:book_store_app/core/Theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        const Text(
          "BOOKSTORE",
          style: TextStyle(
            fontSize: 36,
            color: AppTheme.kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 2),
        Image.asset(
          image,
          height: 265,
          width: 235,
        ),
      ],
    );
  }
}
