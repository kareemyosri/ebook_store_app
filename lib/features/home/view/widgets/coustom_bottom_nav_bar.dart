import 'package:book_store_app/core/Theme/styles.dart';
import 'package:book_store_app/core/router/app_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/enums.dart';


class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  colorFilter: ColorFilter.mode(
                      MenuState.home == selectedMenu
                          ? AppTheme.kPrimaryColor
                          : inActiveIconColor,
                      BlendMode.srcIn)

                ),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.homeScreen);
                },
                   // Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/Heart Icon.svg",
                    colorFilter: ColorFilter.mode(
                        MenuState.favourite == selectedMenu
                            ? AppTheme.kPrimaryColor
                            : inActiveIconColor,
                        BlendMode.srcIn)
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.favouriteScreen);


                },
              ),
              IconButton(
                icon: SvgPicture.asset("assets/icons/read-book-icon.svg",
                  fit: BoxFit.cover,
                  height: 20,
                  width: 22,
                    colorFilter: ColorFilter.mode(
                        MenuState.books == selectedMenu
                            ? AppTheme.kPrimaryColor
                            : inActiveIconColor,
                        BlendMode.srcIn)
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.allBooksScreen);


                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                    colorFilter: ColorFilter.mode(
                        MenuState.profile == selectedMenu
                            ? AppTheme.kPrimaryColor
                            : inActiveIconColor,
                        BlendMode.srcIn)
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.profileScreen);

                },

              ),
            ],
          )),
    );
  }
}
