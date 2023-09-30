import 'package:book_store_app/features/category/view/screens/category_screen.dart';
import 'package:book_store_app/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../model/get_all_categoriesModel.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late HomeCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = HomeCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
      // {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
      // {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];
    return Padding(
      padding: EdgeInsets.all(4.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          cubit.allCategories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            allCategories: cubit.allCategories[index],
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.icon,
    required this.allCategories,
  });
  final AllCategories allCategories;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(category: allCategories),
          )),
      child: SizedBox(
        width: 20.w,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(2.h),
              height: 17.w,
              width: 17.w,
              decoration: BoxDecoration(
                color: const Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon),
            ),
            SizedBox(height: 0.5.h),
            Text(allCategories.name ?? "", textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
