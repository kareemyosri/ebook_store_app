import 'package:book_store_app/core/Theme/styles.dart';
import 'package:book_store_app/features/home_details/cubit/details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../home/model/productModel.dart';
import '../../../login/view/widgets/DefaultButton.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatefulWidget {
  final Products products;

  const Body({super.key, required this.products});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late DetailsCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = DetailsCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(products: widget.products),
        SizedBox(
          height: 2.h,
        ),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: widget.products,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: const Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 4.w, right: 64),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${widget.products.price ?? ""} L.E',
                              style: const TextStyle(
                                  color: AppTheme.kTextColor,
                                  decoration: TextDecoration.lineThrough)),
                          Text(
                              widget.products.priceAfterDiscount == null
                                  ? '${double.parse(widget.products.price!) * widget.products.discount! / 100} L.E'
                                  : '${widget.products.priceAfterDiscount.toString()} L.E',
                              style: const TextStyle(
                                  color: AppTheme.kPrimaryColor)),
                        ],
                      ),
                    ),
                    // ColorDots(product: product),
                    BlocConsumer<DetailsCubit, DetailsState>(
                      listener: (context, state) {
                        if (state is AddToCartSuccessfullyState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Added Successfully'),
                              duration: Duration(seconds: 1),
                              showCloseIcon: true,
                            ),
                          );
                          Navigator.pop(context);
                        } else if (state is AddToCartErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('something went Wrong'),
                              duration: Duration(seconds: 1),
                              showCloseIcon: true,
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        return TopRoundedContainer(
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
                              onPressed: () {
                                cubit.addToCart(
                                    id: widget.products.id.toString());
                              },
                            ),
                          ),
                        );
                      },
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
