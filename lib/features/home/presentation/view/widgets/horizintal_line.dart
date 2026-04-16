import 'package:flutter/material.dart';

class HorizintalLine extends StatelessWidget {
  const HorizintalLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 48),
      width: double.infinity,
      height: 1.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
    );
  }
}
