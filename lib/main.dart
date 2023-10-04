import 'package:book_store_app/core/Theme/styles.dart';
import 'package:book_store_app/features/Forgot_password/cubit/password_cubit.dart';
import 'package:book_store_app/features/cart/cubit/cart_cubit.dart';
import 'package:book_store_app/features/home_details/cubit/details_cubit.dart';
import 'package:book_store_app/features/login/cubit/login_cubit.dart';
import 'package:book_store_app/features/login/view/screen/login_screen.dart';
import 'package:book_store_app/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:book_store_app/features/onboarding/view/screen/onboarding_screen.dart';
import 'package:book_store_app/features/profile/cubit/profile_cubit.dart';
import 'package:book_store_app/features/register/cubit/register_cubit.dart';
import 'package:book_store_app/features/search/cubit/search_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'core/bloc_observer.dart';
import 'core/database/local_database/cache_helper.dart';
import 'core/database/local_database/secure_cache.dart';
import 'core/database/remoteDatabase/DioHelper.dart';
import 'core/router/app_router.dart';
import 'features/Forgot_password/view/screens/success_ForgotPassword_screen.dart';
import 'features/changePassword/cubit/changepassword_cubit.dart';
import 'features/home/cubit/home_cubit.dart';
import 'features/home/view/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterSecureStorageCache.init();
  Bloc.observer = MyBlocObserver();
  CashHelper.init();
  DioHelper.init();
  runApp(
      // DevicePreview(
      //   //enabled: !kReleaseMode,
      //     tools: const [
      //       ...DevicePreview.defaultTools
      //     ],
      //     builder: (BuildContext context) => const MyApp() ,
      //     ),

      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnBoardingCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()
            ..getSlider()
            ..getBestSeller()
            ..getNewArrivals()
            ..getFavouriteItems()
            ..getAllCategories(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
        BlocProvider(
          create: (context) => DetailsCubit(),
        ),
        BlocProvider(
          create: (context) => ChangepasswordCubit(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(),
        ),
        BlocProvider(
          create: (context) => PasswordCubit(),
        ),
      ],
      child: Sizer(
        builder: (BuildContext context, Orientation orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: AppTheme.kPrimaryLightColor),
              useMaterial3: true,
            ),
            // builder: (context, child) {},
            //home: SuccessForgotPasswordScreen(),
            onGenerateRoute: onGenerateRouter,
          );
        },
      ),
    );
  }
}
