import 'package:book_store_app/features/login/view/widgets/DefaultButton.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:sizer/sizer.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Email Verification"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter the 6 digit code',
              style: TextStyle(
                color: const Color(0xFF111827),
                fontSize: 13.5.sp,
                // fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Please confirm your account by entering the authorization code sen to ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 11.5.sp,
                      //fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: '****-****-7234',
                    style: TextStyle(
                      color: const Color(0xFF111827),
                      fontSize: 11.5.sp,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            OTPTextField(
                controller: otpController,
                length: 6,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 45,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 8,
                style: TextStyle(
                  color: const Color(0xFF222741),
                  fontSize: 12.sp,
                  fontFamily: 'SFProDisplay',
                  fontWeight: FontWeight.w500,
                ),
                onChanged: (pin) {
                  print("Changed: " + pin);
                },
                onCompleted: (pin) {
                  print("Completed: " + pin);
                }),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {},
                    child: Text(
                      "Resend Code",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13.5.sp,
                        //fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                SizedBox(
                  width: 1.w,
                ),
                // Text("42s",
                //   style: TextStyle(
                //     color: AppTheme.primary5,
                //     fontSize: 13.5.sp,
                //     fontFamily: 'SFProDisplay',
                //     fontWeight: FontWeight.w500,
                //
                //   ),
                // ),
              ],
            ),
            const Spacer(),
            DefaultButton(onPressed: () {}, text: "Verify"),
          ],
        ),
      ),
    );
  }
}
