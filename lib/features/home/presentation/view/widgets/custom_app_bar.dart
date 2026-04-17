import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset('assets/icons/profile_picture.svg', height: 44),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello, John',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.text2Color,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            SvgPicture.asset('assets/icons/Good Morning.svg', height: 16),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            // color: Colors.grey.shade50,
            color: Colors.grey.shade100,
            // shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(14),
          ),
          child: SvgPicture.asset(
            'assets/icons/bell.svg',
            height: 19,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(width: 20),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(13),
            // shape: BoxShape.circle,
          ),
          child: SvgPicture.asset('assets/icons/bag.svg', height: 22),
        ),
      ],
    );
  }
}
