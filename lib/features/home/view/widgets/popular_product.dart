import 'package:book_store_app/features/home/cubit/home_cubit.dart';
import 'package:book_store_app/features/home/view/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../model/productModel.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  final String title;
  final List<Products> products;
  const PopularProducts({super.key, required this.title, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: 4.w),
          child: SectionTitle(title: title, press: () {}),
        ),
        SizedBox(height: 2.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                products.length,
                    (index) {
                  return ProductCard(product: products[index]);
                },
              ),
              SizedBox(width: 4.w),
            ],
          ),
        )
      ],
    );
  }
}

