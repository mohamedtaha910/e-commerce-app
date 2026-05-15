import 'package:flutter/material.dart';

class NoOrder extends StatelessWidget {
  const NoOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset('assets/icons/no_order.png', height: 200)],
          ),
          SizedBox(height: 24),
          Text(
            'No Orders Yet ! ',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
