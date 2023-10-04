import 'package:book_store_app/features/login/view/widgets/DefaultButton.dart';
import 'package:book_store_app/features/login/view/widgets/TextFormField.dart';
import 'package:book_store_app/features/profile/cubit/profile_cubit.dart';
import 'package:book_store_app/features/profile/model/user.dart';
import 'package:book_store_app/features/profile/view/widgets/profile_pic.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class MyAccountScreenBody extends StatefulWidget {
  const MyAccountScreenBody({super.key});
  @override
  State<MyAccountScreenBody> createState() => _MyAccountScreenBodyState();
}

class _MyAccountScreenBodyState extends State<MyAccountScreenBody> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  late ProfileCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = ProfileCubit.get(context);

    final ProfileModel user = cubit.state.user;
    print("user: ${user.name}");
    nameController.text = user.name;
    emailController.text = user.email;
    if (user.phone != null) {
      phoneController.text = user.phone!;
    }
    if (user.address != null) {
      addressController.text = user.address!;
    }
    if (user.city != null) {
      cityController.text = user.city!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const ProfilePic(action: ProfileAction.update),
              const SizedBox(height: 30),
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
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextFormField(
                autoValidateMode: AutovalidateMode.onUserInteraction,
                labelText: 'Address',
                controller: addressController,
                hintText: 'Address',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'address must not be empty';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextFormField(
                autoValidateMode: AutovalidateMode.onUserInteraction,
                labelText: 'Phone',
                controller: addressController,
                hintText: 'Phone',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'phone must not be empty';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextFormField(
                autoValidateMode: AutovalidateMode.onUserInteraction,
                labelText: 'City',
                controller: cityController,
                hintText: 'City',
                validator: (value) {
                  return null;
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(height: 8.h),
              BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state.profileStatus == ProfileStatus.updated) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('User data updated successfuly'),
                        duration: Duration(seconds: 1),
                        showCloseIcon: true,
                      ),
                    );
                    Navigator.pop(context);
                  }
                  if (state.profileStatus == ProfileStatus.error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('Something went wrong while updating!')),
                    );
                  }
                },
                builder: (context, state) {
                  return BuildCondition(
                    condition: state.profileStatus != ProfileStatus.loading,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: DefaultButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          // if (_formRegisterKey.currentState!.validate()) {
                          cubit.updateUserData(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            address: addressController.text,
                            city: cityController.text,
                          );
                          // }
                        },
                        text: 'Update',
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
