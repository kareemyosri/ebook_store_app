import 'package:book_store_app/features/profile/cubit/profile_cubit.dart';
import 'package:book_store_app/features/profile/view/screens/my_account_screen.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ProfileAction { edit, update }

class ProfilePic extends StatelessWidget {
  final ProfileAction action;
  const ProfilePic({
    required this.action,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        //  overflow: Overflow.visible,
        children: [
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state.profileStatus == ProfileStatus.loaded || state.profileStatus==ProfileStatus.updated) {
                return CircleAvatar(
                    backgroundImage: NetworkImage(state.user.image!));
              }
              return CircleAvatar(
                child: SvgPicture.asset("assets/icons/User.svg",
                    width: 40, height: 40),
              );
            },
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white),
                  ),
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: () {
                  // (action == ProfileAction.edit)
                  //     ? Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => MyAccountScreenBody()))
                  //     : () {};
                },
                child: (action == ProfileAction.edit)
                    ? SvgPicture.asset("assets/icons/Plus Icon.svg")
                    : SvgPicture.asset("assets/icons/remove.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
