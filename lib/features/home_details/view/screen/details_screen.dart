import 'package:book_store_app/features/home/model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../widgets/body.dart';



class DetailsScreen extends StatelessWidget {
  final Products products;

  const DetailsScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
          leading: SizedBox(
            height: 4.h,
            width: 4.h,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
              ),

              onPressed: () => Navigator.pop(context),
              child: SvgPicture.asset(
                "assets/icons/Back ICon.svg",
                height: 15,
              ),
            ),
          ),
      ),
      body: Body(products: products),
    );
  }
}


