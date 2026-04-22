import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.verticalPadding,
    required this.color,
    required this.textColor,
  });
  final String title;
  final double verticalPadding;
  final void Function()? onTap;
  final Color color;
  final Color textColor;

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
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          // color: AppColors.primaryColor,
          color: color,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
