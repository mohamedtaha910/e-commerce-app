import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class DescribtionSection extends StatelessWidget {
  const DescribtionSection({
    super.key,
    required this.describtion,
    required this.brand,
  });
  final String describtion;
  final String brand;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Describtion',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withAlpha(50),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.store , color: AppColors.secondaryColor, size: 24,)),
            Text(
              ' Brand : $brand',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          describtion,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
