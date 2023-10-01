import 'package:book_store_app/core/router/app_route.dart';
import 'package:book_store_app/features/profile/cubit/profile_cubit.dart';
import 'package:book_store_app/features/profile/view/screens/my_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late ProfileCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = ProfileCubit.get(context)..getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
           const ProfilePic(action: ProfileAction.edit),
          const SizedBox(height: 10),
          BlocBuilder<ProfileCubit, ProfileState>(
            //buildWhen: (previous,current)=>,
            builder: (context, state) {
              print(state.profileStatus);
              return Text(
                ProfileCubit.get(context).state.user.name,
              );
            },
          ),
          const SizedBox(height: 5),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return Text(
                ProfileCubit.get(context).state.user.email,
              );
            },
          ),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => Navigator.pushNamed(context, AppRoute.accountDetailsScreen),
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
