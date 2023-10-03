import 'package:book_store_app/core/Theme/styles.dart';
import 'package:book_store_app/features/Forgot_password/cubit/password_cubit.dart';
import 'package:book_store_app/features/login/view/widgets/DefaultButton.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';

import '../../../../core/router/app_route.dart';
import '../../../login/view/widgets/TextFormField.dart';



class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  late PasswordCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit= PasswordCubit.get(context);

  }
  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordCheckController = TextEditingController();

  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordCubit, PasswordState>(
      listener: (context, state) {
        // TODO: implement listener
        //if state is sucess navigate to next screen
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,

          ),
          body: Padding(
            padding:  EdgeInsets.all(4.w),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Form(
                    //autovalidateMode: AutovalidateMode.onUserInteraction,

                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create new password',
                          style: Theme.of(context).textTheme.headlineSmall
                        ),
                        SizedBox(height: 1.h,),
                        Text(
                          'Set your new password so you can login and access App',
                          style:  Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppTheme.kTextColor)
                        ),
                        SizedBox(height: 4.h,),
                        CustomTextFormField(
                            autoValidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value){

                              if (value!.isEmpty) {

                                return 'Password must not be empty';
                              }

                              return null;

                            },
                            controller: passwordController,

                            hintText: "Enter your new password",
                            suffixIcon: IconButton(onPressed: (){
                              cubit.changeIcon();
                            },
                              icon:cubit.obscure? const Icon(Icons.visibility_off_outlined): const Icon(Icons.visibility_outlined) ,),
                            suffixIconColor: MaterialStateColor.resolveWith((
                                states) =>
                            states.contains(MaterialState.focused)
                                ? AppTheme.kPrimaryColor
                                : AppTheme.iconColor),
                            obscureText: cubit.obscure),
                        SizedBox(height: 1.h,),

                        SizedBox(height: 2.h,),

                        CustomTextFormField(
                            autoValidateMode: AutovalidateMode.onUserInteraction,

                            validator: (value) {
                              if (value != passwordController.text) {

                                return 'Both password must match';
                              }
                             return null;
                            },

                            controller: passwordCheckController,

                            hintText: "Enter your new password",
                            suffixIcon: IconButton(onPressed: (){
                              cubit.changeIcon();
                            },
                              icon:cubit.obscure? const Icon(Icons.visibility_off_outlined): const Icon(Icons.visibility_outlined) ,),
                            suffixIconColor: MaterialStateColor.resolveWith((
                                states) =>
                            states.contains(MaterialState.focused)
                                ? AppTheme.kPrimaryColor
                                : AppTheme.iconColor),
                            obscureText: cubit.obscure
                        ),
                        SizedBox(height: 1.h,),

                      ],
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child:BlocConsumer<PasswordCubit, PasswordState>(
                      listener: (context,state){
                        if(state is ResetSuccess){
                          Navigator.pushNamed(
                              context, AppRoute.successForgotPasswordScreen);
                        }
                        if (state is ResetError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Something went wrong!')),
                          );
                        }
                      },
                      builder: (context, state) {
                        return BuildCondition(
                          condition: state is! ResetLoading,
                          builder: (context) => DefaultButton(
                            text: 'Request Password Reset',
                            onPressed: () {
                              cubit.createPassword(passwordController.text,passwordCheckController.text);

                            },
                          ),
                          fallback: (context) => const Center(
                              child: CircularProgressIndicator()),

                        );
                      },
                    )

                )

              ],
            ),
          ),

        );
      },
    );
  }
}
