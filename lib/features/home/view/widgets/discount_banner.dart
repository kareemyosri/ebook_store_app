import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
     super.key,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
       height: 90,
      width: double.infinity,
      margin: EdgeInsets.all(2.h),
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
        vertical: 1.5.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: const TextStyle(color: Colors.white),
          children: [
            const TextSpan(text: "A Summer Surpise\n"),
            TextSpan(
              text: "Cashback 20%",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
