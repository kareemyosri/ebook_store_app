
import 'package:book_store_app/features/login/view/screen/login_screen.dart';
import 'package:flutter/material.dart';
import '../../features/register/view/screen/register_screen.dart';
import 'app_route.dart';



Route? onGenerateRouter(RouteSettings settings){
  switch(settings.name){
    case AppRoute.loginScreen:
      return MaterialPageRoute(builder: (_)=>  const LoginScreen());
    // case AppRoute.onBoardingScreen:
    //   return MaterialPageRoute(builder: (_)=>  const OnboardingScreen());
    //
    // case AppRoute.loginScreen:
    //   return MaterialPageRoute(builder: (_)=>  const LoginScreen());
    //
    case AppRoute.registerScreen:
      return MaterialPageRoute(builder: (_)=>  const RegisterScreen());
    // case AppRoute.layoutScreen:
    //   return MaterialPageRoute(builder: (_)=>  const LayoutScreen());
    // case AppRoute.detailsScreen:
    //   final args=settings.arguments as Doctors;
    //
    //   return MaterialPageRoute(builder: (_)=>  HomeDetailsScreen(doctor: args,));
    // case AppRoute.editProfileScreen:
    //   return MaterialPageRoute(builder: (_)=>  const EditProfileScreen());
    // case AppRoute.detailsHistoryScreen:
    //   final args=settings.arguments as AppointmentsData ;
    //   return MaterialPageRoute(builder: (_)=>  HistoryDetails(data: args,));


    default:
      return null;

  }

}