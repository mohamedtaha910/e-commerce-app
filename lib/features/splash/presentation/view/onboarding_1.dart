import 'package:e_commerce_app/features/splash/presentation/view/onboarding_2.dart';
import 'package:e_commerce_app/features/splash/presentation/view/widgets/onboarding_body.dart';
import 'package:flutter/material.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingBody(
        image: 'assets/splash_images/onboarding_1.svg',
        title: 'assets/splash_images/Shop What You Love.svg',
        desc: 'assets/splash_images/desc1.svg',
        buttonTitle: 'Get Started',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Onboarding2()),
          );
        },
        isLast: false,
      ),
    );
  }
}
