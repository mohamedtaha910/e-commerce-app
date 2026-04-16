import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.imagePath});
  final String imagePath ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Stack(
        children: [
          Container(
            height: 350,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                // shape: BoxShape.circle,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white, width: 4),
              ),
              child: SvgPicture.asset('assets/icons/heart.svg', height: 22),
            ),
          ),
        ],
      ),
    );
  }
}