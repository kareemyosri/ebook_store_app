import 'dart:ffi';

import 'package:book_store_app/core/Theme/styles.dart';
import 'package:book_store_app/core/router/app_route.dart';
import 'package:book_store_app/features/home/model/productModel.dart';
import 'package:book_store_app/features/home_details/view/screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FavouriteItem extends StatelessWidget {
  final Products product;
  const FavouriteItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, AppRoute.productDetailsScreen,arguments: product);
      },
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(product.image!), fit: BoxFit.cover)),
                // child: ,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name!,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.clip),
                const SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: product.priceAfterDiscount==null?
                    '${double.parse(product.price!)* product.discount!/100} L.E  ':
                    '${product.priceAfterDiscount.toString()} L.E  ',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppTheme.kPrimaryColor,
                    ),
                    children: [
                      TextSpan(
                        text: " ${product.price} L.E",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
