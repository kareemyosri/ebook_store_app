import 'package:book_store_app/core/router/app_route.dart';
import 'package:book_store_app/features/login/view/widgets/FormError.dart';
import 'package:book_store_app/features/login/view/widgets/no_account.dart';
import 'package:book_store_app/features/login/view/widgets/social_card.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/Theme/styles.dart';
import '../../../../core/database/local_database/secure_cache.dart';
import '../../../../core/enums.dart';
import '../../cubit/login_cubit.dart';
import '../widgets/DefaultButton.dart';
import '../widgets/TextFormField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;

  late TextEditingController emailController;

  late TextEditingController passwordController;
  final _formLoginKey = GlobalKey<FormState>();

  late LoginCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = LoginCubit.get(context);
    emailController = TextEditingController();
    passwordController = TextEditingController();

    FlutterSecureStorageCache.read(key: MySharedKeys.email).then((value) async {
      email = value;
      emailController.text = email ?? "";
      await FlutterSecureStorageCache.read(key: MySharedKeys.password)
          .then((value) {
        password = value;
        passwordController.text = password ?? "";
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 0.4.h),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 2.8.h,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Sign in with your email and password  \nor continue with social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.0.h),
                  Form(
                    key: _formLoginKey,
                    child: Column(
                      children: [
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
                        SizedBox(height: 3.0.h),
                        BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            return CustomTextFormField(
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
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
                            );
                          },
                        ),
                        SizedBox(height: 3.0.h),
                        Row(
                          children: [
                            BlocBuilder<LoginCubit, LoginState>(
                              builder: (context, state) {
                                return Checkbox(
                                  value: cubit.isChecked,
                                  activeColor: AppTheme.kPrimaryColor,
                                  onChanged: (value) =>
                                      cubit.changeCheckBox(value),
                                );
                              },
                            ),
                            const Text("Remember me"),
                            const Spacer(),
                            GestureDetector(
                              // onTap: () => Navigator.pushNamedAndRemoveUntil(context, AppRoute.layoutScreen, (route) => false),
                              child: const Text(
                                "Forgot Password",
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        ),
                        FormError(errors: cubit.errors),
                        SizedBox(height: 2.0.h),
                        BlocConsumer<LoginCubit, LoginState>(
                          listener: (context, state) {
                            if (state is LoginSuccessState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Logged-in Successfully'),
                                  duration: Duration(seconds: 1),
                                  showCloseIcon: true,
                                ),
                              );
                              // if user wants to be remembered, then write his credits in the cache
                              if (cubit.isChecked) {
                                FlutterSecureStorageCache.write(
                                    key: MySharedKeys.token,
                                    value: cubit.loginModel?.data?.token);
                              }
                              Navigator.pushNamedAndRemoveUntil(context,
                                  AppRoute.homeScreen, (route) => false);
                              print(cubit.loginModel?.data?.token);
                              print('logged');
                            }
                            if (state is LoginErrorState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Something went wrong!')),
                              );
                            }
                          },
                          builder: (context, state) {
                            return BuildCondition(
                              condition: state is! LoginLoadingState,
                              builder: (context) => DefaultButton(
                                text: "Continue",
                                onPressed: () {
                                  if (_formLoginKey.currentState!.validate()) {
                                    FocusScope.of(context).unfocus();
                                    cubit.login(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                    FlutterSecureStorageCache.write(
                                        key: MySharedKeys.email,
                                        value: emailController.text);
                                    FlutterSecureStorageCache.write(
                                        key: MySharedKeys.password,
                                        value: passwordController.text);
                                  } else {
                                    FocusScope.of(context).unfocus();
                                  }
                                },
                              ),
                              fallback: (context) => const Center(
                                  child: CircularProgressIndicator()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
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
                  const NoAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
