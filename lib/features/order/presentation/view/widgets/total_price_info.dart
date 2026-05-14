import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TotalPriceInfo extends StatelessWidget {
  const TotalPriceInfo({super.key, required this.total});
  final double total;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12, width: 0.4),
      ),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.money_dollar_circle_fill,
            color: Colors.green.shade700,
            size: 28,
          ),
          SizedBox(width: 12),
          Icon(Icons.arrow_forward_ios, color: Colors.green.shade700, size: 12),
          SizedBox(width: 12),
          Text(
            '\$${total.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
