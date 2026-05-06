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
              top: 6,
              bottom: 6,
              left: 8,
              right: 4,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black12 , width: 0.6),
              // borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.arrow_back_ios, color: Colors.black54, size: 18),
          ),
        ),
        Spacer(),
        SvgPicture.asset('assets/icons/Product_Details.svg'),
        Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black12 , width: 0.6),
            // borderRadius: BorderRadius.circular(12),
          ),
          child: SvgPicture.asset('assets/icons/bag.svg'),
        ),
      ],
    );
  }
}
