import 'package:book_store_app/core/router/app_route.dart';
import 'package:book_store_app/features/home/model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/Theme/styles.dart';
import '../../../home_details/view/screen/details_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
  });

  final double width, aspectRetio;
  final Products product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.35,
        child: GestureDetector(
          onTap: () =>
              // Navigator.push(
              // context,
              // MaterialPageRoute(
              //     builder: (context) => DetailsScreen(
              //           products: product,
              //         ))),
          Navigator.pushNamed(context, AppRoute.productDetailsScreen,arguments: product),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: AppTheme.kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.network(
                      product.image ?? "",
                      fit: BoxFit.contain,
                    )
                    // Hero(
                    //   tag: product.id.toString(),
                    //   child: Image.network(product.image??"",fit: BoxFit.contain,),
                    // ),
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                product.name ?? "",
                style: const TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.priceAfterDiscount}",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(1.h),
                      height: 4.h,
                      width: 4.h,
                      decoration: BoxDecoration(
                        color: true
                            ? AppTheme.kPrimaryColor.withOpacity(0.15)
                            : AppTheme.kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color: true
                            ? const Color(0xFFFF4848)
                            : const Color(0xFFDBDEE4),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
