import 'package:book_store_app/features/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/enums.dart';
import '../../../home/view/widgets/coustom_bottom_nav_bar.dart';
import '../widgets/body.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const ProfileScreenBody();
  }
}


class ProfileScreenBody extends StatefulWidget {
  const ProfileScreenBody({super.key});

  @override
  State<ProfileScreenBody> createState() => _ProfileScreenBodyState();
}

class _ProfileScreenBodyState extends State<ProfileScreenBody> {
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
