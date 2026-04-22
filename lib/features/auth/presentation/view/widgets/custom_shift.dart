import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomShift extends StatelessWidget {
  const CustomShift({super.key, required this.destination, required this.text, required this.text2});
  final Widget destination;
  final String text;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text2,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        // SizedBox(width: 4),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => destination),
            );
          },
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
