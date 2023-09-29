import 'package:flutter/material.dart';

import '../../../../core/Theme/styles.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.width = double.infinity})
      : super(key: key);
  final void Function()? onPressed;
  final double? width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppTheme.kPrimaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// class CustomElevatedButton extends StatelessWidget {
//    final void Function()? onPressed;
//    final double? width;
//    final String text;

//    const CustomElevatedButton( this.onPressed, this.text, {super.key, this.width=double.infinity});


//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,
//       child: ElevatedButton(onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppTheme.primaryColor,
//           padding: const EdgeInsets.all(16),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(4), // <-- Radius
//           ),
//         ),
//           child:Text(text,
//           style: GoogleFonts.roboto(
//             color: Colors.white,
//             fontSize: 11.5.sp,
//             fontWeight: FontWeight.w500,
//           )
//           ),

//       ),
//     );
//   }
// }
