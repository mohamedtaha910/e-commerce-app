// import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const CustomAppBar(),
          const SizedBox(height: 36),
          CustomSearchBar(),
        ],
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.78,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
          width:MediaQuery.of(context).size.width * 0.12,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            // shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SvgPicture.asset('assets/icons/Filter.svg'),
        ),
      ],
    );
  }
}
