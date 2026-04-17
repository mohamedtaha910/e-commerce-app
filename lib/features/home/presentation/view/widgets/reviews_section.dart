import 'package:e_commerce_app/core/models/product_model/review.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/horizintal_line.dart';
import 'package:flutter/material.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({
    super.key,
    required this.reviews,
    required this.rating,
  });
  final List<Review> reviews;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Reviews (${reviews.length})',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 3),
                Text(
                  rating.toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),

        ...reviews.map(
          (e) => Column(
            children: [
              const SizedBox(height: 24),
              ReviewItem(review: e),
              const SizedBox(height: 24),
              const HorizintalLine(),
              // const SizedBox(height: 16),
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.review});
  final Review review;

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
                  review.reviewerName!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                RatingStars(rating: review.rating!),
                const SizedBox(height: 8),
              ],
            ),
          ],
        ),
        SizedBox(height: 16),
        Text(
          review.comment!,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
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
