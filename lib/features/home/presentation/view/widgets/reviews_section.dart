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
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.amber.withAlpha(50),
                borderRadius: BorderRadius.circular(35),
                border: Border.all(
                  color: Colors.amber.withAlpha(25),
                  width: 0.8,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.star_rounded,
                    color: Colors.amber.shade600,
                    size: 20,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    rating.toString(),
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        ListView.separated(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: ReviewItem(review: reviews[index]),
            );
          },
          separatorBuilder: (context, index) {
            return HorizintalLine(
              color: Colors.grey.shade200,
              height: 1,
              horizontalMargin: 48,
              verticalMargin: 0,
              borderRadius: 12,
            );
          },
          itemCount: reviews.length,
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/user2.png',
          height: 36,
          width: 40,
          fit: BoxFit.contain,
        ),

        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              review.reviewerName!,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2),
            RatingStars(rating: review.rating!),
            const SizedBox(height: 10),
            Text(
              review.comment!,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              // textAlign: TextAlign.center,
            ),
          ],
        ),
        Spacer(),
        Text(
          review.date!.toString().split(' ')[0],
          style: TextStyle(
            color: Colors.black38,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
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
        return index < rating
            ? Padding(
                padding: const EdgeInsets.only(right: 1.5),
                child: Icon(
                  Icons.star_rounded,
                  color: Colors.amber.shade600,
                  size: 16,
                ),
              )
            : Icon(Icons.star_border_rounded, color: Colors.black54, size: 16);
      }),
    );
  }
}
