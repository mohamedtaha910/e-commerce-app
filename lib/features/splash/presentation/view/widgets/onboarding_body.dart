import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/splash/presentation/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.buttonTitle,
    required this.onTap,
    required this.isLast,
  });
  final String image;
  final String title;
  final String desc;
  final String buttonTitle;
  final void Function()? onTap;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Spacer(flex: 3),
          SvgPicture.asset(image, height: 500),
          Spacer(flex: 1),
          SvgPicture.asset(
            title,
            width: MediaQuery.of(context).size.width * 0.6,
          ),
          const SizedBox(height: 20),
          SvgPicture.asset(
            desc,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          Spacer(flex: 3),
          Row(
            children: [
              isLast
                  ? CustomButton(
                      title: 'Previous',
                      titleSize: 15,
                      onTap: Navigator.of(context).pop,
                      verticalPadding: 8,
                      color: Colors.grey.shade200,
                      textColor: Colors.black,
                      horizontalMargin: 8,
                    )
                  : SizedBox.shrink(),
              Expanded(
                child: CustomButton(
                  title: buttonTitle,
                  titleSize: isLast ? 16 : 17,
                  onTap: onTap,
                  verticalPadding: isLast ? 8 : 12,
                  color: AppColors.primaryColor,
                  textColor: Colors.white,
                  horizontalMargin: 8,
                ),
              ),
            ],
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
