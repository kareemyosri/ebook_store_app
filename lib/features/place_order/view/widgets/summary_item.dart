import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/Theme/styles.dart';
import '../../model/checkoutModel.dart';

class SummaryItem extends StatefulWidget {
  const SummaryItem({Key? key, required this.item}) : super(key: key);
  final CartItems item;

  @override
  State<SummaryItem> createState() => _SummaryItemState();
}

class _SummaryItemState extends State<SummaryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        children: <Widget>[

          Expanded(
              child: ListTile(
                  title: TitleText(
                    text: widget.item.itemProductName!,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  subtitle: Row(
                    children: <Widget>[

                      TitleText(
                        text: widget.item.itemTotal!,
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
                      text: 'x${widget.item.itemQuantity!}',
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
