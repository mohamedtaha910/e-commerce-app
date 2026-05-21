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
            Icon(
              Icons.store_mall_directory_rounded,
              color: AppColors.secondaryColor,
              size: 24,
            ),
            const SizedBox(width: 4),
            Icon(Icons.chevron_right_rounded, color: Colors.black54, size: 18),
            SizedBox(width: 4),
            Container(
              padding: const EdgeInsets.only(left: 8),
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(width: 1, color: Colors.black12),
                  right: BorderSide(width: 1, color: Colors.black12),
                ),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Text(
                ' $brand  ',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
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
