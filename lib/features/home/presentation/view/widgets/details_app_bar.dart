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
            padding: const EdgeInsets.all(2.6),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black12, width: 0.6),
              // borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.chevron_left_rounded,
              color: Colors.black54,
              size: 28,
            ),
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
            border: Border.all(color: Colors.black12, width: 0.6),
            // borderRadius: BorderRadius.circular(12),
          ),
          child: SvgPicture.asset('assets/icons/bag.svg'),
        ),
      ],
    );
  }
}
