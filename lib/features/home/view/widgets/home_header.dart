import 'package:book_store_app/core/Theme/styles.dart';
import 'package:book_store_app/core/router/app_route.dart';
import 'package:book_store_app/features/home/cubit/home_cubit.dart';
import 'package:book_store_app/features/login/view/widgets/DefaultButton.dart';
import 'package:book_store_app/features/search/cubit/search_cubit.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    super.key,
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  late SearchCubit cubit;
  RangeValues values = const RangeValues(1, 1000);

  @override
  void initState() {
    super.initState();
    cubit = SearchCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              return BuildCondition(
                condition: SearchCubit.get(context).isSearching,
                builder: (context) {
                  return IconBtnWithCounter(
                      svgSrc: "assets/icons/filter-svgrepo-com.svg",
                      press: () => showFilterModal(context));
                },
                fallback: (BuildContext context) {
                  return FutureBuilder(
                    future: Future.delayed(const Duration(milliseconds: 500)),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Wrap(
                          spacing: 8.0,
                          children: [
                            IconBtnWithCounter(
                                svgSrc: "assets/icons/Cart Icon.svg",
                                press: () {
                                  Navigator.pushNamed(
                                      context, AppRoute.cartScreen);
                                } //Navigator.pushNamed(context, CartScreen.routeName),
                                ),
                            IconBtnWithCounter(
                              svgSrc: "assets/icons/Bell.svg",
                              numOfitem: 3,
                              press: () {},
                            ),
                          ],
                        );
                      }
                      return Container();
                    },
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }

  showFilterModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) {
        return BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 20),
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Filter',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        minWidth: 40,
                        height: 40,
                        color: Colors.grey.shade300,
                        elevation: 0,
                        padding: const EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: const Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Category',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 40,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              HomeCubit.get(context).allCategories.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => cubit.changeCatergory(
                                  index,
                                  HomeCubit.get(context)
                                      .allCategories[index]
                                      .id!),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                margin: const EdgeInsets.only(right: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
                                decoration: BoxDecoration(
                                  color: cubit.selectedCategoryIndex == index
                                      ? AppTheme.primaryColor
                                      : Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    HomeCubit.get(context)
                                        .allCategories[index]
                                        .name!,
                                    style: TextStyle(
                                        color:
                                            cubit.selectedCategoryIndex == index
                                                ? Colors.white
                                                : Colors.black,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  // Slider Price Renge filter
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Price Range',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${cubit.selectedRange.start.toStringAsFixed(2)} L.E',
                            style: TextStyle(
                                color: Colors.grey.shade500, fontSize: 12),
                          ),
                          Text(" - ",
                              style: TextStyle(color: Colors.grey.shade500)),
                          Text(
                            '${cubit.selectedRange.end.toStringAsFixed(2)} L.E',
                            style: TextStyle(
                                color: Colors.grey.shade500, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      return RangeSlider(
                          values: cubit.selectedRange,
                          min: 0,
                          max: 1000,
                          divisions: 10,
                          inactiveColor: Colors.grey.shade300,
                          activeColor: AppTheme.kPrimaryColor,
                          labels: RangeLabels(
                            '${cubit.selectedRange.start.toStringAsFixed(2)} L.E',
                            '${cubit.selectedRange.end.toStringAsFixed(2)} L.E',
                          ),
                          onChanged: (RangeValues values) {
                            print(values.start);

                            cubit.changeRange(values);
                          });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultButton(
                    onPressed: () => cubit.fetchDataWithFilters(),
                    text: 'Filter',
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
