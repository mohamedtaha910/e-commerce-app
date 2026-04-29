import 'package:flutter/material.dart';

class CustomCartEmpty extends StatelessWidget {
  const CustomCartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset('assets/icons/cart_empty.png', width: 195),
                ),
                const SizedBox(height: 24),
                Text(
                  'Your Cart is Empty ! ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ],
            );
  }
}