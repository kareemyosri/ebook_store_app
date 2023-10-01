import 'package:book_store_app/features/cart/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late CartCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = CartCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: 4.w),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context,state){
          if (state is RemoveItemSuccessfullyState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Deleted Successfully'),
                duration: Duration(seconds: 1),
                showCloseIcon: true,
              ),
            );

          }
          if (state is RemoveItemErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Something went wrong!')),
            );
          }
        },
        builder: (context, state) {
          return ListView.builder(
            itemCount: cubit.cartItems.length,
            itemBuilder: (context, index) =>
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child:
                  // CartCard(item: cubit.cartItems[index],
                    Dismissible(
                      key: Key( cubit.cartItems[index].itemId.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {

                        cubit.cartItems.removeAt(index);
                        cubit.removeItem(itemId: cubit.cartItems[index].itemId.toString());
                      },
                      background: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE6E6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            const Spacer(),
                            SvgPicture.asset("assets/icons/Trash.svg"),
                          ],
                        ),
                      ),
                      child: CartCard(item: cubit.cartItems[index]),
                  ),
                ),
          );
        },
      ),
    );
  }
}
