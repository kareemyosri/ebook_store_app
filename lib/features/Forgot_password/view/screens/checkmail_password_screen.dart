import 'package:book_store_app/features/Forgot_password/cubit/password_cubit.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/Theme/styles.dart';
import '../../../../core/router/app_route.dart';
import '../../../login/view/widgets/DefaultButton.dart';

class CheckMailForgotPasswordScreen extends StatefulWidget {
  const CheckMailForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<CheckMailForgotPasswordScreen> createState() => _CheckMailForgotPasswordScreenState();
}

class _CheckMailForgotPasswordScreenState extends State<CheckMailForgotPasswordScreen> {
  OtpFieldController otpController = OtpFieldController();
  late PasswordCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit=PasswordCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding:  const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //SvgPicture.asset("assets/images/auth/Email Ilustration.svg"),
            SizedBox(height: 2.h,),
            Text(
              'Check your Email',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall
            ),
            SizedBox(height: 1.h,),
            Text(
              'We have sent a reset password to your email address',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppTheme.kTextColor)
            ),
            SizedBox(height: 1.h,),
            OTPTextField(
                controller: otpController,
                length: 6,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 45,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 8,

                onChanged: (pin) {
                 // print(pin);
                },
                onCompleted: (pin) {
                  cubit.getRequestCode(pin);
                 // print(pin);
                }),
            const Spacer(),
            BlocConsumer<PasswordCubit, PasswordState>(
              listener: (context,state){
                if(state is VerifyCodeSuccess){
                  Navigator.pushNamed(context, AppRoute.createNewPasswordScreen);
                }
                if (state is VerifyCodeError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Something went wrong!')),
                  );
                }
              },
              builder: (context, state) {
                return BuildCondition(
                  condition: state is! VerifyCodeLoading,
                  builder: (context) => DefaultButton(
                    text: 'Verify Code',
                    onPressed: () {

                      cubit.verifyCode();

                    },
                  ),
                  fallback: (context) => const Center(
                      child: CircularProgressIndicator()),

                );
              },
            )
          ],
        ),
      ),

    );
  }
}
