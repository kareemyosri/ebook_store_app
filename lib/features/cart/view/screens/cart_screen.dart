import 'package:book_store_app/features/cart/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/body.dart';
import '../widgets/check_out_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: CartScreenBody(),
    );
  }
}

class CartScreenBody extends StatefulWidget {
  @override
  State<CartScreenBody> createState() => _CartScreenBodyState();
}

class _CartScreenBodyState extends State<CartScreenBody> {
  late CartCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = CartCubit.get(context)..getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          const Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return Text(
                "${cubit.cartItems.length} items",
                style: Theme.of(context).textTheme.caption,
              );
            },
          ),
        ],
      ),
    );
  }
}
