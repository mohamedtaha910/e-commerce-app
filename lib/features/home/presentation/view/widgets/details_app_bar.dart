import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 10,
              right: 6,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.arrow_back_ios, color: Colors.black54, size: 17),
          ),
        ),
        Spacer(),
        SvgPicture.asset('assets/icons/Product_Details.svg'),
        Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SvgPicture.asset('assets/icons/bag.svg'),
        ),
      ],
    );
  }
}
