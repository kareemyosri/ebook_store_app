import 'package:book_store_app/core/Theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


import '../../../home/model/productModel.dart';
import '../../../login/view/widgets/DefaultButton.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Products products;
  const Body({super.key, required this.products}) ;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(products: products),
        SizedBox(height: 2.h,),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                products: products,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: const Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 4.w,right: 64),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${products.price??""} L.E',
                              style: const TextStyle(
                                  color: AppTheme.kTextColor,
                                  decoration: TextDecoration.lineThrough)
                          ),
                          Text('${products.priceAfterDiscount.toString()} L.E',
                            style:  const TextStyle(color: AppTheme.kPrimaryColor)
                          ),

                        ],
                      ),
                    ),
                    // ColorDots(product: product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.15,
                          right: MediaQuery.of(context).size.width * 0.15,
                          bottom: 4.h,
                          top: 2.h,
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
