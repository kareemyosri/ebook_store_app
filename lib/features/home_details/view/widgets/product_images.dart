import 'package:book_store_app/features/home/model/productModel.dart';
import 'package:flutter/material.dart';



class ProductImages extends StatefulWidget {
  const ProductImages({
     super.key,
    required this.products,
  }) ;

  final Products products;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width*0.8,
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.products.id.toString(),
              child: Image.network(widget.products.image??""),
            ),
          ),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
      ],
    );
  }

}
