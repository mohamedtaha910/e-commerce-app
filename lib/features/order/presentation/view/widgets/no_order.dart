import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class NoOrder extends StatelessWidget {
  const NoOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset('assets/icons/no_order.png', height: 150)],
          ),
          // SizedBox(height: 30),
          const SizedBox(height: 38),

          Text(
            'No Orders Yet ! ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
          // const SizedBox(height: 38),
          // Text(
          //   'You have not made any orders yet.\nStart shopping to make an order.',
          //   textAlign: TextAlign.center,
          //   style: TextStyle(fontSize: 12, color: Colors.black45),
          // ),
        ],
      ),
    );
  }
}
