import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class SectionTitle extends StatelessWidget {
  const SectionTitle({
     super.key,
    required this.title,
    required this.press,
  });

  final String title;
  final void Function()?  press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: const Text(
            "See More",
            style: TextStyle(color: Color(0xFFBBBBBB)),
          ),
        ),
      ],
    );
  }
}
