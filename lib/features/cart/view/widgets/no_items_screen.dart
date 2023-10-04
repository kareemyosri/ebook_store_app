import 'package:book_store_app/core/Theme/styles.dart';
import 'package:book_store_app/features/login/view/widgets/DefaultButton.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EmptyResultsScreen extends StatelessWidget {
  const EmptyResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 128.0),
          Image.asset(
            "assets/images/empty-box.png",
            width: 200,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Text('Nothing is here!',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text('start by adding some items in your cart',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppTheme.kTextColor)),
                  const Spacer(),
                  DefaultButton(
                    text: "Done",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
