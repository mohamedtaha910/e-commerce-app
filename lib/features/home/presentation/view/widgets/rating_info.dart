import 'package:flutter/material.dart';

class RatingInfo extends StatelessWidget {
  const RatingInfo({super.key, required this.rating, required this.reviews});
  final double rating ;
  final int reviews ;

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
              Text(rating.toString() , style: TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
        ),

        SizedBox(width: 10),
        Text(
          ('$reviews reviews'),
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
        ),
      ],
    );
  }
}
