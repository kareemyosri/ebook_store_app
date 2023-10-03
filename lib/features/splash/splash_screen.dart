import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/router/app_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 2050),
            (){
          Navigator.pushNamedAndRemoveUntil(context, AppRoute.onBoardingScreen, (route) => false);
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/icons/splash.gif",),
              //https://cdn.dribbble.com/users/2367833/screenshots/7816190/media/b1aaf5c98510012b56422d1619dc62e8.gif
      )
        ),
      ),
    );
  }
}
