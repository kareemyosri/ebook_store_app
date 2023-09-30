import 'package:flutter/material.dart';

import '../../../../core/enums.dart';
import '../widgets/body.dart';
import '../widgets/coustom_bottom_nav_bar.dart';


class HomeScreen extends StatelessWidget {
  //static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    bottomNavigationBar:  CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
