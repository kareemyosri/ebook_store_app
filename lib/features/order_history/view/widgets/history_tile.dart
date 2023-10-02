import 'package:book_store_app/core/Theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/router/app_route.dart';
import '../../model/historyModel.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({Key? key, required this.order}) : super(key: key);
  final Orders order;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      margin: EdgeInsets.symmetric(horizontal: 4.w,vertical: 1.h ),
      child: ListTile(
        onTap: (){
          Navigator.pushNamed(context, AppRoute.orderHistoryDetailsScreen,arguments: order.id.toString());
        },
        title: Text("Order #${order.orderCode}"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("On ${order.orderDate}"),

            Text("Total ${order.total} L.E "),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: AppTheme.kPrimaryColor,

            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "${order.status}",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
