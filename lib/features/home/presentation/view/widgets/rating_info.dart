import 'package:flutter/material.dart';

class RatingInfo extends StatelessWidget {
  const RatingInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.amber.withAlpha(50),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 20),
              SizedBox(width: 6),
              Text("4.5", style: TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
        ),

        SizedBox(width: 10),
        Text(
          "(120 reviews)",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
        ),
      ],
    );
  }
}