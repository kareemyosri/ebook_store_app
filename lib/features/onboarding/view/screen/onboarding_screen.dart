import 'package:book_store_app/core/Theme/styles.dart';
import 'package:book_store_app/core/router/app_route.dart';
import 'package:book_store_app/features/login/view/widgets/DefaultButton.dart';
import 'package:book_store_app/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:book_store_app/features/onboarding/model/onboardingModel.dart';
import 'package:book_store_app/features/onboarding/view/widgets/onboarding_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/local_database/secure_cache.dart';
import '../../../../core/enums.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late OnBoardingCubit cubit;
  final controller = PageController();

  @override
  void initState() {
    super.initState();
    cubit = OnBoardingCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) => cubit.changePageIndex(value),
                itemCount: splashData.length,
                itemBuilder: (context, index) => OnBoardingContent(
                  image: splashData[index].image,
                  text: splashData[index].text,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    BlocBuilder<OnBoardingCubit, OnBoardingState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            splashData.length,
                            (index) => buildDot(index: index),
                          ),
                        );
                      },
                    ),
                    const Spacer(flex: 3),
                    BlocBuilder<OnBoardingCubit, OnBoardingState>(
                      builder: (context, state) {
                        return DefaultButton(
                            text: (cubit.state.currentPage ==
                                    splashData.length - 1)
                                ? "Get Started!"
                                : "Continue",
                            onPressed: () {
                              if (cubit.state.currentPage ==
                                  splashData.length - 1) {
                                FlutterSecureStorageCache.write(
                                    key: MySharedKeys.onBoarding,
                                    value: 'true');

                                Navigator.pushNamedAndRemoveUntil(context,
                                    AppRoute.loginScreen, (route) => false);
                              } else {
                                controller.nextPage(
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.easeIn);
                              }
                            });
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: AppTheme.kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: cubit.state.currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: cubit.state.currentPage == index
            ? AppTheme.kPrimaryColor
            : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
