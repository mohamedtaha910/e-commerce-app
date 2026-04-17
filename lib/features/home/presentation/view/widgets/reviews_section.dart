import 'package:e_commerce_app/features/home/presentation/view/widgets/horizintal_line.dart';
import 'package:flutter/material.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Reviews (4)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                ),
                Text(
                  ' 4.5',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        ReviewItem(),
        const SizedBox(height: 24),
        HorizintalLine(),
        const SizedBox(height: 24),
        ReviewItem(),
        const SizedBox(height: 24),
        HorizintalLine(),
        const SizedBox(height: 24),
        ReviewItem(),
        const SizedBox(height: 24),
        HorizintalLine(),
        const SizedBox(height: 24),
        
      ],
    );
  }
}

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/user2.png',
              height: 45,
              width: 45,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                RatingStars(rating: 3),
                const SizedBox(height: 8),
              ],
            ),
          ],
        ),
        SizedBox(height: 16),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          style: TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w500),
          // textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class RatingStars extends StatelessWidget {
  const RatingStars({super.key, required this.rating});
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 18,
        );
      }),
    );
  }
}
