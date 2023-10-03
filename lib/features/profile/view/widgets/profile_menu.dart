import 'package:book_store_app/core/Theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.text,
    required this.icon,
    this.press,
  }) ;

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFF5F6F9),
        ),

        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              colorFilter: const ColorFilter.mode(AppTheme.kPrimaryColor, BlendMode.srcIn),
              width: 22,
              height: 22,
            ),
            const SizedBox(width: 20),
            Expanded(child: Text(text,style: const TextStyle(color: AppTheme.kTextColor),)),
            const Icon(Icons.arrow_forward_ios,color: AppTheme.kTextColor),
          ],
        ),
      ),
    );
  }
}
