import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/database/local_database/secure_cache.dart';
import '../../core/enums.dart';
import '../../core/router/app_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? token;
  String? rememberMe;
  String? onBoarding;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterSecureStorageCache.read(key: MySharedKeys.token).then((value) async {
      token = value;
      print(token);
      //emailController.text = email ?? "";
      await FlutterSecureStorageCache.read(key: MySharedKeys.rememberMe)
          .then((value) async {
        rememberMe = value;
        print('reme $rememberMe');
        await FlutterSecureStorageCache.read(key: MySharedKeys.onBoarding)
            .then((value)  {
          onBoarding = value;
          print('board $onBoarding');

        });

      });
    });

    Timer(const Duration(milliseconds: 1950),
            (){
              if(token!.isNotEmpty && rememberMe=='true'){
                Navigator.pushNamedAndRemoveUntil(context, AppRoute.homeScreen, (route) => false);

              }
              else if(token!.isNotEmpty && rememberMe=='false'){
                Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginScreen, (route) => false);
              }
              else if(token!.isEmpty && onBoarding=='true'){
                Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginScreen, (route) => false);
              }
              else{
                Navigator.pushNamedAndRemoveUntil(context, AppRoute.onBoardingScreen, (route) => false);

              }

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
