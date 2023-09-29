import 'package:buildcondition/buildcondition.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/Theme/styles.dart';
import '../../../../core/database/local_database/secure_cache.dart';
import '../../../../core/enums.dart';
import '../../../../core/router/app_route.dart';
import '../../cubit/login_cubit.dart';
import '../widgets/ElvatedButton.dart';
import '../widgets/TextFormField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;

  late TextEditingController emailController;

  late TextEditingController passwordController;
  var formLoginKey = GlobalKey<FormState>();

  late LoginCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = LoginCubit.get(context);
    emailController = TextEditingController();
    passwordController = TextEditingController();

    FlutterSecureStorageCache.read(key: MySharedKeys.email).then((value) {
        email = value;
        emailController.text = email ?? "";
        FlutterSecureStorageCache.read(key: MySharedKeys.password).then((value) {
          email = value;
          passwordController.text = password ?? "";

        });
    });


  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Login Successfully'),
                duration: Duration(seconds: 1),showCloseIcon: true,),
            );

            FlutterSecureStorageCache.write(key: MySharedKeys.token, value: cubit.loginModel?.data?.token).then((value){
            //  Navigator.pushNamedAndRemoveUntil(context, AppRoute.layoutScreen, (route) => false);
              print( cubit.loginModel?.data?.token);
              print('logged');
            });
          }
          if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Something Went Wrong')),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Form(
                key: formLoginKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "Login Now!",
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
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            value: cubit.isChecked,
                            onChanged: (bool? value) {
                              cubit.changeCheckBox(value);
                            },
                          ),

                          Text(
                            "Keep me logged in",
                            style: GoogleFonts.roboto(
                              color: AppTheme.blackColor,
                                fontSize: 13.5.sp, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "No account yet?",
                            style: GoogleFonts.roboto(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoute.registerScreen);

                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) {
                                //       return const LoginScreen();
                                //     }));
                              },
                              child: Text(
                                "Register here",
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
                        condition: state is! LoginLoadingState,
                        builder: (context) => CustomElevatedButton(
                                () {
                              if (formLoginKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                cubit.login(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                                FlutterSecureStorageCache.write(key: MySharedKeys.email, value: emailController.text);
                                FlutterSecureStorageCache.write(key: MySharedKeys.password, value: passwordController.text);



                              } else {
                                FocusScope.of(context).unfocus();
                              }
                            },

                            'LOGIN'

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
