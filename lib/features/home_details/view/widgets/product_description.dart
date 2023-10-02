import 'package:book_store_app/core/Theme/styles.dart';
import 'package:book_store_app/features/home/cubit/home_cubit.dart';
import 'package:book_store_app/features/home/model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.product,
    required this.pressOnSeeMore,
  });

  final Products product;
  final GestureTapCallback pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Text(
            product.name ?? "",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 4.w,
            right: 64,
          ),
          child: Text(
            product.category ?? "",
            maxLines: 1,
            style: const TextStyle(color: AppTheme.kPrimaryColor),
          ),
        ),
        //SizedBox(height: 1.h,),
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () =>
                HomeCubit.get(context).handleFavourite(product: product),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Container(
                  padding: EdgeInsets.all(4.w),
                  width: 64,
                  decoration: BoxDecoration(
                    color: HomeCubit.get(context).checkFavourite(product.id!)
                        ? const Color(0xFFFFE6E6)
                        : const Color(0xFFF5F6F9),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/Heart Icon_2.svg",
                    color: HomeCubit.get(context).checkFavourite(product.id!)
                        ? const Color(0xFFFF4848)
                        : const Color(0xFFDBDEE4),
                    height: 20,
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),

        Padding(
          padding: EdgeInsets.only(
            left: 4.w,
            right: 64,
          ),
          child: Text(
            product.description ?? "",
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
                      fontWeight: FontWeight.w600,
                      color: AppTheme.kPrimaryColor),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: AppTheme.kPrimaryColor,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
