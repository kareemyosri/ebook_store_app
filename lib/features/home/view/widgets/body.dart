import 'package:book_store_app/features/home/cubit/home_cubit.dart';
import 'package:book_store_app/features/search/cubit/search_cubit.dart';
import 'package:book_store_app/features/search/view/search_screen.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late SearchCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = SearchCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 3.h),
            const HomeHeader(),
            SizedBox(height: 1.h),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                return BuildCondition(
                  condition: cubit.isSearching,
                  builder: (context) {
                    return const SearchScreen();
                  },
                  fallback: (context) {
                    return const LandingScreen();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late HomeCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = HomeCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (cubit.images.isNotEmpty) {
              return Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.5,
                    enlargeCenterPage: true,
                  ),
                  items: cubit.images
                      .map(
                        (item) => Container(
                          child: Container(
                            margin: const EdgeInsets.all(5.0),
                            child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(5.0)),
                                child: Image.network(item ?? "",
                                    fit: BoxFit.cover, width: 1000.0)),
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            }
            return const SizedBox();
          },
        ),

        const DiscountBanner(),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (cubit.allCategories.isNotEmpty) {
              return const Categories();
            }
            return const SizedBox();
          },
        ),
        // SpecialOffers(),
        // SizedBox(height: 3.h),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (cubit.bestSeller.isNotEmpty) {
              return PopularProducts(
                title: 'Best Seller',
                products: cubit.bestSeller,
              );
            }
            return const SizedBox();
          },
        ),
        SizedBox(height: 3.h),

        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (cubit.newArrivals.isNotEmpty) {
              return PopularProducts(
                title: 'New Arrivals',
                products: cubit.newArrivals,
              );
            }
            return const SizedBox();
          },
        ),
        SizedBox(height: 3.h),
      ],
    );
  }
}
