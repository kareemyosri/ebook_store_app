import 'package:book_store_app/features/login/view/widgets/DefaultButton.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';

import '../../../../core/Theme/styles.dart';
import '../../../../core/router/app_route.dart';
import '../../../login/view/widgets/TextFormField.dart';
import '../../cubit/password_cubit.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  late PasswordCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = PasswordCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // title: const Text('Reset Password'),
        // centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reset Password',
              style: Theme.of(context).textTheme.headlineSmall,
              // style: TextStyle(
              //   color: AppTheme.kTextColor,
              // ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              'Enter the email address you used when you joined and we’ll send you instructions to reset your password.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 4.h,
            ),
            CustomTextFormField(
                controller: emailController,
                labelText: 'Email',
                // prefixIcon: const Icon(Icons.email_outlined),
                // prefixIconColor: MaterialStateColor.resolveWith((states) =>
                // states.contains(MaterialState.focused)
                //     ? AppTheme.kPrimaryColor
                //     : AppTheme.kPrimaryLightColor),
                hintText: "Enter your email",
                obscureText: false),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'You remember your password',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoute.loginScreen, (route) => false);
                    },
                    child: Text(
                      'Login',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppTheme.kPrimaryColor),
                    )),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            BlocConsumer<PasswordCubit, PasswordState>(
              listener: (context,state){
                if(state is RequestCodeSuccess){
                  Navigator.pushNamed(
                      context, AppRoute.checkEmailForgetPasswordScreen);
                }
                if (state is RequestCodeError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Something went wrong!')),
                  );
                }
              },
              builder: (context, state) {
                return BuildCondition(
                  condition: state is! RequestCodeLoading,
                  builder: (context) => DefaultButton(
                    text: 'Request Password Reset',
                    onPressed: () {
                      cubit.requestResetCode(emailController.text);

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
