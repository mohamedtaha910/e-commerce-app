import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.78,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/search.svg'),
              const SizedBox(width: 10),
              const Text(
                'Search products',
                style: TextStyle(
                  fontSize: 14,
                  // color: AppColors.text2Color,
                  color: Colors.black45,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        // const Spacer(),
        const SizedBox(width: 6),
        Container(
          width: MediaQuery.of(context).size.width * 0.12,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            // shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SvgPicture.asset('assets/icons/Filter.svg', height: 24),
        ),
      ],
    );
  }
}
