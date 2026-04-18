import 'package:flutter/material.dart';

class CustomNoItem extends StatelessWidget {
  const CustomNoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset('assets/icons/cart_empty.png', height: 150)),
        SizedBox(height: 24),
        Text(
          'No Item Found !',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
