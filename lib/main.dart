import 'package:book_store_app/features/login/cubit/login_cubit.dart';
import 'package:book_store_app/features/register/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'core/bloc_observer.dart';
import 'core/database/local_database/cache_helper.dart';
import 'core/database/local_database/secure_cache.dart';
import 'core/database/remoteDatabase/DioHelper.dart';
import 'core/router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterSecureStorageCache.init();
  Bloc.observer = MyBlocObserver();
  CashHelper.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),

      ],
      child: Sizer(
        builder: (BuildContext context, Orientation orientation,
            DeviceType deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            theme: ThemeData(

              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            //  home: const MyHomePage(title: 'Flutter Demo Home Page'),
            onGenerateRoute: onGenerateRouter,
          );
        },

      ),
    );
  }
}

