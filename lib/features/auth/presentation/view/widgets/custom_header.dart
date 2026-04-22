import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/custom_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, required this.image, required this.text});
  final String image;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.55,
          width: MediaQuery.of(context).size.width,
          child: SvgPicture.asset(
            'assets/auth_images/header1.svg',
            // color: const Color.fromARGB(255, 198, 172, 151),
            color: AppColors.secondaryColor.withAlpha(120),
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 25,
          left: 80,
          child: SvgPicture.asset(
            image,
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height * 0.32,
            // width: 130,
          ),
        ),
        Positioned(
          top: 20,
          left: 12,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.only(
                top: 6,
                bottom: 6,
                left: 8,
                right: 4,
              ),
              decoration: BoxDecoration(
                color: Colors.black38,
                // color: Colors.white10,
                // color: AppColors.primaryColor.withAlpha(200),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
            ),
          ),
        ),
        Positioned(
          bottom: 60,
          left: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                text,
                width: 130,
              ),
              SizedBox(height: 8),
              CustomLine(),
            ],
          ),
        ),
      ],
    );
  }
}
