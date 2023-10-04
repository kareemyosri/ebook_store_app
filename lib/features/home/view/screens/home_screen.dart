import 'package:book_store_app/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../core/enums.dart';
import '../widgets/body.dart';
import '../widgets/coustom_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeCubit cubit;
  @override
  void didChangeDependencies() {
     cubit = HomeCubit.get(context);
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    cubit.close();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
