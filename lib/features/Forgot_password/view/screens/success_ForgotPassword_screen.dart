import 'package:book_store_app/core/Theme/styles.dart';
import 'package:book_store_app/core/router/app_route.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import '../../../login/view/widgets/DefaultButton.dart';

class SuccessForgotPasswordScreen extends StatelessWidget {
  const SuccessForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Image.asset("assets/images/success.png"),

          Expanded(
            child: Padding(
              padding:  EdgeInsets.all(4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 2.h,),
                  Text(
                    'Password changed successfully!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall
                  ),
                  SizedBox(height: 1.h,),
                  Text(
                    'Your password has been changed successfully, we will let you know if there are more problems with your account',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppTheme.kTextColor)
                  ),
                  const Spacer(),
                  DefaultButton(  text: "Done",
                    onPressed: () {

                        Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginScreen, (route) => false);


                    },),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
