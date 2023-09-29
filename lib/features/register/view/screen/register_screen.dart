import 'package:buildcondition/buildcondition.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/Theme/styles.dart';
import '../../../../core/router/app_route.dart';
import '../../../login/view/widgets/ElvatedButton.dart';
import '../../../login/view/widgets/TextFormField.dart';
import '../../cubit/register_cubit.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var formRegisterKey = GlobalKey<FormState>();
  late RegisterCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = RegisterCubit.get(context);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Registered Successfully'),
                duration: Duration(seconds: 1),
                showCloseIcon: true,
              ),
            );
            Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginScreen, (route) => false);

          }
          if (state is RegisterErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Something Went Wrong')),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Form(
                key: formRegisterKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "Let’s get started!",
                        style: GoogleFonts.roboto(
                            fontSize: 28.sp, fontWeight: FontWeight.w400,
                            color: AppTheme.blackColor
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        '''Login to access your assigned tasks and personal overview.
                             ''',
                        style: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontSize: 13.5.sp,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),

                      CustomTextFormField(
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.name,
                        labelText: 'Name',
                        controller: nameController,
                        hintText: 'Name',
                        validator: (value)  {
                          if (value == null || value.isEmpty) {
                            return 'please add your name';
                          }
                          return null;
                        },
                        obscureText: false,

                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        labelText: 'Email',
                        controller: emailController,
                        hintText: 'Email',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'email must not be empty';
                          }
                          final bool isValid = EmailValidator.validate(value);
                          if (!isValid) {
                            return "please enter right email";
                          }
                          return null;
                        }, obscureText: false,

                      ),


                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        autoValidateMode: AutovalidateMode.onUserInteraction,

                        labelText: 'Password',
                        suffixIcon: IconButton(onPressed: () { cubit.changePasswordVisibility(); },
                          icon:cubit.isPassword ? const  Icon(Icons.visibility_off_outlined): const Icon(Icons.visibility_outlined) ,),

                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        hintText: 'Password',

                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          }
                          //         RegExp regex = RegExp(
                          //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#\$&*~]).{8,}$');
                          //         if (!regex.hasMatch(value)) {
                          //         return
                          //           ''' password must contain at least one capital letter and
                          // one special character''';
                          //         }
                          return null;
                        }, obscureText: cubit.isPassword,),

                      SizedBox(
                        height: 2.h,
                      ),
                      CustomTextFormField(
                        autoValidateMode: AutovalidateMode.onUserInteraction,

                        labelText: 'Confirm Password',
                        suffixIcon: IconButton(onPressed: () { cubit.changePasswordVisibility(); },
                          icon:cubit.isPassword ? const  Icon(Icons.visibility_off_outlined): const Icon(Icons.visibility_outlined) ,),

                        keyboardType: TextInputType.visiblePassword,
                        controller: confirmPasswordController,
                        hintText: 'Password',

                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          }
                          if (value != passwordController.text){
                            return 'confirm password must match password';
                            //         RegExp regex = RegExp(
                            //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#\$&*~]).{8,}$');
                            //         if (!regex.hasMatch(value)) {
                            //         return
                            //           ''' password must contain at least one capital letter and
                            // one special character''';
                            //         }
                            return null;
                          }
                          return null;
                        }, obscureText: cubit.isPassword,),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Already have an account?",
                            style: GoogleFonts.roboto(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginScreen, (route) => false);
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) {
                                //       return const LoginScreen();
                                //     }));
                              },
                              child: Text(
                                "Login here.",
                                style: GoogleFonts.roboto(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color.fromRGBO(3, 14, 25, 0.70)),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      BuildCondition(
                        condition: state is! RegisterLoadingState,
                        builder: (context) => Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: CustomElevatedButton(
                            () {
                              if (formRegisterKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                cubit.register(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    passwordConfirmation:
                                    confirmPasswordController.text);
                              } else {
                                FocusScope.of(context).unfocus();
                              }
                            },
                            'Register',
                          ),
                        ),
                        fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),

                      ),

                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
