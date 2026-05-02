import 'package:flutter/material.dart';

class HorizintalLine extends StatelessWidget {
  const HorizintalLine({
    super.key,
    required this.height,
    required this.horizontalMargin,
    required this.color,
    required this.verticalMargin,
    required this.borderRadius,
  });
  final double height;
  final double horizontalMargin;
  final Color color;
  final double verticalMargin;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin,
        vertical: verticalMargin,
      ),
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
      ),
    );
  }
}
