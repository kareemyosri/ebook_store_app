import 'package:book_store_app/features/changePassword/cubit/changepassword_cubit.dart';
import 'package:book_store_app/features/login/view/widgets/DefaultButton.dart';
import 'package:book_store_app/features/login/view/widgets/TextFormField.dart';
import 'package:book_store_app/features/profile/cubit/profile_cubit.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final newPasswordConfirmationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late ChangepasswordCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = ChangepasswordCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Password"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(height: 8.h),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        labelText: 'Current Password',
                        keyboardType: TextInputType.visiblePassword,
                        controller: currentPasswordController,
                        hintText: 'Current Password',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 2.h),
                      CustomTextFormField(
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        labelText: 'New Password',
                        keyboardType: TextInputType.visiblePassword,
                        controller: newPasswordController,
                        hintText: 'New Password',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter new password';
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 2.h),
                      CustomTextFormField(
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        labelText: 'New Password Confirmation',
                        keyboardType: TextInputType.visiblePassword,
                        controller: newPasswordConfirmationController,
                        hintText: 'New Password Confirmation',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          }
                          if(value!=newPasswordConfirmationController.text){
                            return 'must be same password';
                          }

                          return null;
                        },
                      )
                    ],
                  )),
              SizedBox(height: 8.h),
              BlocConsumer<ChangepasswordCubit, ChangepasswordState>(
                listener: (context, state) {
                  if (state is ChangePasswordSuccessfullyState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('password updated successfuly'),
                        duration: Duration(seconds: 1),
                        showCloseIcon: true,
                      ),
                    );
                    Navigator.pop(context);
                  }
                  if (state is ChangePasswordErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                          Text('Something went wrong while updating!')),
                    );
                  }
                },
                builder: (context, state) {
                  return BuildCondition(
                    condition: state is !ChangePasswordLoadingState,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: DefaultButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState!.validate()) {
                            cubit.updateUserPassword(
                              currentPassword: currentPasswordController.text,
                              newPassword: newPasswordController.text,
                              newPasswordConfirmation:
                              newPasswordConfirmationController.text,
                            );
                          }
                        },
                        text: 'Update Password',
                      ),
                    ),
                    fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
