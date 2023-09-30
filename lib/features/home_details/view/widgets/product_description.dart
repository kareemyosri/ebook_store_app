import 'package:book_store_app/core/Theme/styles.dart';
import 'package:book_store_app/features/home/model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';


class ProductDescription extends StatelessWidget {
  const ProductDescription({
     super.key,
    required this.products,
    required this.pressOnSeeMore,
  });

  final Products products;
  final GestureTapCallback pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 4.w),
          child: Text(
            products.name??"",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 4.w,
            right: 64,
          ),
          child: Text(
            products.category??"",
            maxLines: 1,
            style: const TextStyle(color: AppTheme.kPrimaryColor),
          ),
        ),
        //SizedBox(height: 1.h,),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(4.w),
            width: 64,

            decoration: const BoxDecoration(
              color:
                  true ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SvgPicture.asset(
              "assets/icons/Heart Icon_2.svg",
              color:
                 true ? const Color(0xFFFF4848) : const Color(0xFFDBDEE4),
              height: 20,
            ),
          ),
        ),
        SizedBox(height: 1.h,),

        Padding(
          padding: EdgeInsets.only(
            left: 4.w,
            right: 64,
          ),
          child: Text(
            products.description??"",
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 4.w,
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {},
            child: const Row(
              children: [
                Text(
                  "See More Detail",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color:AppTheme.kPrimaryColor),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color:AppTheme.kPrimaryColor,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
