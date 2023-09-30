import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class TopRoundedContainer extends StatelessWidget {
  const TopRoundedContainer({
     super.key,
    required this.color,
    required this.child,
  }) ;

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2.w),
      padding: EdgeInsets.only(top: 6.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: child,
    );
  }
}
