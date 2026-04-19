import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.shippingInfo,
    required this.warrantyInfo,
    required this.returnInfo,
    required this.stock,
  });
  final String shippingInfo;
  final String warrantyInfo;
  final String returnInfo;
  final int stock;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoRow(title: shippingInfo, icon: Icons.local_shipping),

        SizedBox(height: 8),

        InfoRow(title: warrantyInfo, icon: Icons.verified_rounded),

        SizedBox(height: 8),

        InfoRow(title: '$stock Items Left', icon: Icons.inventory_2_outlined),

        SizedBox(height: 8),
        InfoRow(title: returnInfo, icon: Icons.restart_alt),
      ],
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            // color: Colors.grey.shade200,
            color: AppColors.secondaryColor.withAlpha(50),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.secondaryColor, size: 22),
        ),
        SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
