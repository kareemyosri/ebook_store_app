
import 'package:book_store_app/features/place_order/cubit/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../login/view/widgets/DefaultButton.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({
    super.key,
    required this.phoneController,
    required this.addressController, required this.formkey,
  });
  final GlobalKey<FormState>  formkey;

  final TextEditingController phoneController;
  final TextEditingController addressController;

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  late OrderCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = OrderCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 3.w,
        horizontal: 6.w,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<OrderCubit, OrderState>(
                  builder: (context, state) {
                    return Text.rich(
                      TextSpan(
                        text: "Total:\n",
                        children: [
                          TextSpan(
                            text: "${cubit.checkoutModel?.data?.total} L.E ",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                BlocBuilder<OrderCubit, OrderState>(
                  builder: (context, state) {
                    if(state is PlaceOrderLoading){
                      return const Center(
                          child: CircularProgressIndicator());
                    }
                    return SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.5,
                      child: DefaultButton(
                        text: "Order Now",
                        onPressed: () {
                          if(widget.formkey.currentState!.validate()){
                            FocusScope.of(context).unfocus();
                            cubit.placeOrder(
                                phone: widget.phoneController.text,
                                address: widget.addressController.text);
                          }
                          //    Navigator.pushNamed(context, AppRoute.orderScreen);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
