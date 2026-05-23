import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.verticalPadding,
    required this.color,
    required this.textColor,
    required this.horizontalMargin,
    required this.titleSize,
    this.isBorder = false,
    this.borderRadius = 25,
  });
  final String title;
  final double titleSize;
  final double verticalPadding;
  final void Function()? onTap;
  final Color color;
  final Color textColor;
  final double horizontalMargin;
  final bool isBorder;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: 24,
        ),
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        decoration: BoxDecoration(
          // color: AppColors.primaryColor,
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          border: isBorder
              ? Border.all(color: AppColors.primaryColor, width: 0.4)
              : null,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: titleSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
