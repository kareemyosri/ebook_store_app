import 'package:flutter/material.dart';
import '../../../../core/enums.dart';
import '../../../home/view/widgets/coustom_bottom_nav_bar.dart';
import '../widgets/body.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // late ProfileCubit cubit;
  // @override
  // void didChangeDependencies() {
  //   cubit=ProfileCubit.get(context);
  //   super.didChangeDependencies();
  // }
  // @override
  // void dispose() {
  //   cubit.close();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: const Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
