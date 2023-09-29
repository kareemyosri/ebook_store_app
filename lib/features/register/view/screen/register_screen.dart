import 'package:book_store_app/features/login/view/widgets/DefaultButton.dart';
import 'package:book_store_app/features/login/view/widgets/social_card.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/Theme/styles.dart';
import '../../../../core/router/app_route.dart';
import '../../../login/view/widgets/TextFormField.dart';
import '../../cubit/register_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formRegisterKey = GlobalKey<FormState>();

  late RegisterCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = RegisterCubit.get(context);
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 4.h), // 4%
                  const Text("Register Account", style: AppTheme.headingStyle),
                  const Text(
                    "Complete your details or continue \nwith social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Form(
                    key: _formRegisterKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.emailAddress,
                          labelText: 'Name',
                          controller: nameController,
                          hintText: 'Name',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'name must not be empty';
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
                          },
                          obscureText: false,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomTextFormField(
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              cubit.changePasswordVisibility();
                            },
                            icon: cubit.isPassword
                                ? const Icon(Icons.visibility_off_outlined)
                                : const Icon(Icons.visibility_outlined),
                          ),
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
                          },
                          obscureText: cubit.isPassword,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomTextFormField(
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          labelText: 'Confirm Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              cubit.changePasswordVisibility();
                            },
                            icon: cubit.isPassword
                                ? const Icon(Icons.visibility_off_outlined)
                                : const Icon(Icons.visibility_outlined),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          controller: confirmPasswordController,
                          hintText: 'Confirm Password',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter password';
                            }
                            if (value != passwordController.text) {
                              return 'confirm password must match password';
                              //         RegExp regex = RegExp(
                              //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#\$&*~]).{8,}$');
                              //         if (!regex.hasMatch(value)) {
                              //         return
                              //           ''' password must contain at least one capital letter and
                              // one special character''';
                              //         }
                            }
                            return null;
                          },
                          obscureText: cubit.isPassword,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),

                        // FormError(errors: errors),
                        SizedBox(height: 8.h),
                        BlocConsumer<RegisterCubit, RegisterState>(
                          listener: (context, state) {
                            if (state is RegisterSuccessState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Registered Successfully'),
                                  duration: Duration(seconds: 1),
                                  showCloseIcon: true,
                                ),
                              );
                              Navigator.pushNamedAndRemoveUntil(context,
                                  AppRoute.loginScreen, (route) => false);
                            }
                            if (state is RegisterErrorState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Something went wrong!')),
                              );
                            }
                          },
                          builder: (context, state) {
                            return BuildCondition(
                              condition: state is! RegisterLoadingState,
                              builder: (context) => Padding(
                                padding: const EdgeInsets.only(bottom: 24),
                                child: DefaultButton(
                                  onPressed: () {
                                    if (_formRegisterKey.currentState!
                                        .validate()) {
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
                                  text: 'Continue',
                                ),
                              ),
                              fallback: (context) => const Center(
                                  child: CircularProgressIndicator()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialCard(
                        icon: "assets/icons/google-icon.svg",
                        press: () {},
                      ),
                      SocialCard(
                        icon: "assets/icons/facebook-2.svg",
                        press: () {},
                      ),
                      SocialCard(
                        icon: "assets/icons/twitter.svg",
                        press: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'By continuing your confirm that you agree \nwith our Term and Condition',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
