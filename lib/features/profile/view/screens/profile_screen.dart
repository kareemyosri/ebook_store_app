import 'package:flutter/material.dart';

import '../../../../core/enums.dart';
import '../../../home/view/widgets/coustom_bottom_nav_bar.dart';
import '../widgets/body.dart';

class ProfileScreen extends StatelessWidget {
  //static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
