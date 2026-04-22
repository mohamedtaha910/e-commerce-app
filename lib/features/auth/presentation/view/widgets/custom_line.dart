import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomLine extends StatelessWidget {
  const CustomLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2.6,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.primaryColor,
      ),
    );
  }
}