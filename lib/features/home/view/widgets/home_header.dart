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
  RangeValues values = RangeValues(1, 1000);

  @override
  void initState() {
    // TODO: implement initState
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
                      press: () {

                        Scaffold.of(context).showBottomSheet(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                                (context) {
                                  return Container(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 20, right: 20, bottom: 20),
                                    height: MediaQuery.of(context).size.height * 0.5,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                                  borderRadius:
                                                  BorderRadius.circular(50)),
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
                                        // const Text(
                                        //   "Color",
                                        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                        // ),
                                        // const SizedBox(
                                        //   height: 10,
                                        // ),
                                        // SizedBox(
                                        //   height: 60,
                                        //   child: ListView.builder(
                                        //     scrollDirection: Axis.horizontal,
                                        //     itemCount: colors.length,
                                        //     itemBuilder: (context, index) {
                                        //       return GestureDetector(
                                        //         onTap: () {
                                        //           setState(() {
                                        //             _selectedColor = index;
                                        //           });
                                        //         },
                                        //         child: AnimatedContainer(
                                        //           duration: const Duration(milliseconds: 300),
                                        //           margin: const EdgeInsets.only(right: 10),
                                        //           decoration: BoxDecoration(
                                        //               color: _selectedColor == index
                                        //                   ? colors[index]
                                        //                   : colors[index].withOpacity(0.5),
                                        //               shape: BoxShape.circle),
                                        //           width: 40,
                                        //           height: 40,
                                        //           child: Center(
                                        //             child: _selectedColor == index
                                        //                 ? const Icon(
                                        //                     Icons.check,
                                        //                     color: Colors.white,
                                        //                   )
                                        //                 : Container(),
                                        //           ),
                                        //         ),
                                        //       );
                                        //     },
                                        //   ),
                                        // ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          'Categories',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),



                                        const SizedBox(
                                          height: 10,
                                        ),
                                        // SizedBox(
                                        //   height: 60,
                                        //   child: ListView.builder(
                                        //     scrollDirection: Axis.horizontal,
                                        //     itemCount: size.length,
                                        //     itemBuilder: (context, index) {
                                        //       return GestureDetector(
                                        //         onTap: () {
                                        //           setState(() {
                                        //             _selectedSize = index;
                                        //           });
                                        //         },
                                        //         child: AnimatedContainer(
                                        //           duration: const Duration(milliseconds: 500),
                                        //           margin: const EdgeInsets.only(right: 10),
                                        //           decoration: BoxDecoration(
                                        //               color: _selectedSize == index
                                        //                   ? Colors.yellow[800]
                                        //                   : Colors.grey.shade200,
                                        //               shape: BoxShape.circle),
                                        //           width: 40,
                                        //           height: 40,
                                        //           child: Center(
                                        //             child: Text(
                                        //               size[index],
                                        //               style: TextStyle(
                                        //                   color: _selectedSize == index
                                        //                       ? Colors.white
                                        //                       : Colors.black,
                                        //                   fontSize: 15),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       );
                                        //     },
                                        //   ),
                                        // ),
                                        // Slider Price Renge filter
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Price Range',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            BlocBuilder<SearchCubit, SearchState>(
                                              builder: (context, state) {
                                                return Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      '\$ ${cubit.selectedRange.start.toStringAsFixed(2)}',
                                                      style: TextStyle(
                                                          color: Colors.grey.shade500,
                                                          fontSize: 12),
                                                    ),
                                                    Text(" - ",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey.shade500)),
                                                    Text(
                                                      '\$ ${cubit.selectedRange.end.toStringAsFixed(2)}',
                                                      style: TextStyle(
                                                          color: Colors.grey.shade500,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                );
                                              },
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
                                                  '\$ ${cubit.selectedRange.start.toStringAsFixed(2)}',
                                                  '\$ ${cubit.selectedRange.end.toStringAsFixed(2)}',
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
                                          onPressed: () {},
                                          text: 'Filter',
                                        )
                                      ],
                                    ),
                                  );
                        });

                      });
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
                  // const Text(
                  //   "Color",
                  //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // SizedBox(
                  //   height: 60,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: colors.length,
                  //     itemBuilder: (context, index) {
                  //       return GestureDetector(
                  //         onTap: () {
                  //           setState(() {
                  //             _selectedColor = index;
                  //           });
                  //         },
                  //         child: AnimatedContainer(
                  //           duration: const Duration(milliseconds: 300),
                  //           margin: const EdgeInsets.only(right: 10),
                  //           decoration: BoxDecoration(
                  //               color: _selectedColor == index
                  //                   ? colors[index]
                  //                   : colors[index].withOpacity(0.5),
                  //               shape: BoxShape.circle),
                  //           width: 40,
                  //           height: 40,
                  //           child: Center(
                  //             child: _selectedColor == index
                  //                 ? const Icon(
                  //                     Icons.check,
                  //                     color: Colors.white,
                  //                   )
                  //                 : Container(),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Size',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // SizedBox(
                  //   height: 60,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: size.length,
                  //     itemBuilder: (context, index) {
                  //       return GestureDetector(
                  //         onTap: () {
                  //           setState(() {
                  //             _selectedSize = index;
                  //           });
                  //         },
                  //         child: AnimatedContainer(
                  //           duration: const Duration(milliseconds: 500),
                  //           margin: const EdgeInsets.only(right: 10),
                  //           decoration: BoxDecoration(
                  //               color: _selectedSize == index
                  //                   ? Colors.yellow[800]
                  //                   : Colors.grey.shade200,
                  //               shape: BoxShape.circle),
                  //           width: 40,
                  //           height: 40,
                  //           child: Center(
                  //             child: Text(
                  //               size[index],
                  //               style: TextStyle(
                  //                   color: _selectedSize == index
                  //                       ? Colors.white
                  //                       : Colors.black,
                  //                   fontSize: 15),
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  // Slider Price Renge filter
                  const SizedBox(
                    height: 20,
                  ),
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
                            '\$ ${cubit.selectedRange.start.toStringAsFixed(2)}',
                            style: TextStyle(
                                color: Colors.grey.shade500, fontSize: 12),
                          ),
                          Text(" - ",
                              style: TextStyle(color: Colors.grey.shade500)),
                          Text(
                            '\$ ${cubit.selectedRange.end.toStringAsFixed(2)}',
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
                  RangeSlider(
                      values: cubit.selectedRange,
                      min: 0,
                      max: 1000,
                      divisions: 10,
                      inactiveColor: Colors.grey.shade300,
                      activeColor: AppTheme.kPrimaryColor,
                      labels: RangeLabels(
                        '\$ ${cubit.selectedRange.start.toStringAsFixed(2)}',
                        '\$ ${cubit.selectedRange.end.toStringAsFixed(2)}',
                      ),
                      onChanged: (RangeValues values) {
                        print(values.start);

                        cubit.changeRange(values);
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultButton(
                    onPressed: () {},
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
