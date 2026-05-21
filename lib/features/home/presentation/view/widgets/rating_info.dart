import 'package:flutter/material.dart';

class RatingInfo extends StatelessWidget {
  const RatingInfo({
    super.key,
    required this.rating,
    required this.reviews,
    this.availabilityStatus,
  });
  final double rating;
  final int reviews;
  final String? availabilityStatus;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.amber.withAlpha(45),
            borderRadius: BorderRadius.circular(35),
          ),
          child: Row(
            children: [
              Icon(
                Icons.star_rate_rounded,
                color: Colors.amber.shade600,
                size: 20,
              ),
              SizedBox(width: 6),
              Text(
                rating.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 107, 42, 14),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),

        SizedBox(width: 10),
        Text(
          ('$reviews reviews'),
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: availabilityStatus == 'In Stock'
                ? Colors.green.withAlpha(40)
                : Colors.red.withAlpha(50),
            borderRadius: BorderRadius.circular(35),
          ),
          child: Text(
            availabilityStatus!,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: availabilityStatus == 'In Stock'
                  ? Colors.green.shade900
                  : Colors.pink.shade700,
            ),
          ),
        ),
      ],
    );
  }
}
