import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoRow(
          title: 'shipping free on orders over \$50',
          icon: Icons.local_shipping,
        ),

        SizedBox(height: 8),

        InfoRow(
          title: '2 years warranty',
          icon: Icons.verified_rounded,
        ),

        SizedBox(height: 8),

        InfoRow(
          title: '60 Items Left',
          icon: Icons.inventory_2_outlined,
        ),

        SizedBox(height: 8),
        InfoRow(
          title: '7 days return policy',
          icon: Icons.restart_alt,
        ),
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
    return Row(children: [Icon(icon , color: const Color.fromARGB(255, 86, 52, 1)), SizedBox(width: 8), Text(title , style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500 , color: Colors.black54),)]);
  }
}
