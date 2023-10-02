import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/Theme/styles.dart';
import '../../model/single_orderModel.dart';

class SummaryHistoryItem extends StatefulWidget {
  const SummaryHistoryItem({Key? key, required this.item}) : super(key: key);
  final OrderProducts item;

  @override
  State<SummaryHistoryItem> createState() => _SummaryHistoryItemState();
}

class _SummaryHistoryItemState extends State<SummaryHistoryItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      //height: 80,
      child: Row(
        children: <Widget>[

          Expanded(
              child: ListTile(
                  title: TitleText(
                    text: widget.item.productName!,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  subtitle: Row(
                    children: <Widget>[

                      TitleText(
                        text: '${widget.item.productPriceAfterDiscount!}',
                        fontSize: 14,
                      ),
                      const TitleText(
                        text: ' L.E ',
                        color: AppTheme.kPrimaryColor,
                        fontSize: 12,
                      ),
                    ],
                  ),
                  trailing: Container(
                    width: 35,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppTheme.lightGrey.withAlpha(150),
                        borderRadius: BorderRadius.circular(10)),
                    child: TitleText(
                      text: 'x${widget.item.orderProductQuantity!}',
                      fontSize: 12,
                    ),
                  )))
        ],
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  const TitleText(
      {super.key,
        required this.text,
        this.fontSize = 18,
        this.color = AppTheme.titleTextColor,
        this.fontWeight = FontWeight.w800});
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.mulish(
            fontSize: fontSize, fontWeight: fontWeight,color: color));
  }
}
