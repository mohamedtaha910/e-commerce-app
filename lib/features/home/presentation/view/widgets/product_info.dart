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
    List<Widget> info = [
      InfoRow(
        label: 'Shipping',
        icon: Icons.local_shipping,
        title: shippingInfo,
      ),
      InfoRow(label: 'Warranty', icon: Icons.wysiwyg, title: warrantyInfo),
      InfoRow(
        label: 'Stock',
        icon: Icons.inventory,
        title: stock.toString() + ' Items Left',
      ),
      InfoRow(label: 'Return', icon: Icons.replay, title: returnInfo),
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
        crossAxisSpacing: 6,
        mainAxisSpacing: 10,
      ),

      itemCount: 4,
      itemBuilder: (context, index) {
        return info[index];
      },
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.title,
    required this.icon,
    required this.label,
  });
  final String label;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12, width: 0.4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
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
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 99, 64, 12),
                ),
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: 108,
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
