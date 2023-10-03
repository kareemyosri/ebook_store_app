import 'package:book_store_app/core/Theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';


class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    super.key,
    required this.svgSrc,
    this.numOfitem = 0,
    required this.press,
  }) ;

  final String svgSrc;
  final int numOfitem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
       // overflow: Overflow.visible,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            height: 6.h,
            width: 6.h,
            decoration: BoxDecoration(
              color: AppTheme.kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(svgSrc,
                colorFilter: const ColorFilter.mode(
                    AppTheme.kPrimaryColor
                       ,
                    BlendMode.srcIn)
            ),
          ),

        ],
      ),
    );
  }
}
