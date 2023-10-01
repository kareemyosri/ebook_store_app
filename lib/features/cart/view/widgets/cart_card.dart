import 'package:book_store_app/core/Theme/styles.dart';
import 'package:book_store_app/features/cart/model/cartModel.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.item,
  }) ;

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
                  text: "${item.itemProductPriceAfterDiscount}L.E " ,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color:AppTheme.kPrimaryColor),
                  children: [
                    TextSpan(
                        text: " x${item.itemProductStock}",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
// class CartCounter extends StatefulWidget {
//   @override
//   _CartCounterState createState() => _CartCounterState();
//
// }
// class _CartCounterState extends State<CartCounter> {
//   int numOfItems = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//
//         buildOutlineButton(
//
//           icon: Icons.remove,
//
//           press: () {
//
//             if (numOfItems > 1) {
//
//               setState(() {
//
//                 numOfItems--;
//
//               });
//
//             }
//
//           },
//
//         ),
//
//         Padding(
//
//           padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
//
//           child: Text(
//
//             // if our item is less  then 10 then  it shows 01 02 like that
//
//             numOfItems.toString().padLeft(2, "0"),
//
//             style: Theme.of(context).textTheme.headline6,
//
//           ),
//
//         ),
//
//         buildOutlineButton(
//
//             icon: Icons.add,
//
//             press: () {
//
//               setState(() {
//
//                 numOfItems++;
//
//               });
//
//             }),
//
//       ],
//
//     );
//
//   }
//
//
//
//   SizedBox buildOutlineButton({IconData icon, Function press}) {
//
//     return SizedBox(
//
//       width: 40,
//
//       height: 32,
//
//       child: OutlineButton(
//
//         padding: EdgeInsets.zero,
//
//         shape: RoundedRectangleBorder(
//
//           borderRadius: BorderRadius.circular(13),
//
//         ),
//
//         onPressed: press,
//
//         child: Icon(icon),
//
//       ),
//
//     );
//
//   }
//
// }

 
