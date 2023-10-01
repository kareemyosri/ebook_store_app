import 'package:book_store_app/core/Theme/styles.dart';
import 'package:book_store_app/features/cart/cubit/cart_cubit.dart';
import 'package:book_store_app/features/cart/model/cartModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.item,
  });

  final CartItems item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(item.itemProductImage!),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.itemProductName!,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "${item.itemProductPriceAfterDiscount}L.E ",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppTheme.kPrimaryColor),
                  children: [
                    TextSpan(
                        text: " x${item.itemProductStock}",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Counter(item: item),
            ],
          ),
        )
      ],
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({required this.item, super.key});
  final CartItems item;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is UpdateItemSuccessfullyState) {
          return const Center(child: CircularProgressIndicator());
        }
        return Row(
          children: <Widget>[
            buildOutlineButton(
              icon: Icons.remove,
              press: () => context.read<CartCubit>().updateItem(
                  itemId: item.itemId.toString(),
                  itemCount: (item.itemQuantity! - 1).toString()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                // if our item is less  then 10 then  it shows 01 02 like that

                item.itemQuantity.toString().padLeft(2, "0"),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            buildOutlineButton(
              icon: Icons.add,
              press: () => context.read<CartCubit>().updateItem(
                  itemId: item.itemId.toString(),
                  itemCount: (item.itemQuantity! + 1).toString()),
            ),
          ],
        );
      },
    );
  }

  SizedBox buildOutlineButton({
    required IconData icon,
    required Function()? press,
  }) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
