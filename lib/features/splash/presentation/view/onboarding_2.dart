// import 'package:e_commerce_app/features/auth/presentation/view/sign_up_page.dart';
import 'package:e_commerce_app/features/auth/presentation/view/welcome_page.dart';
// import 'package:e_commerce_app/features/home/presentation/view/home_page.dart';
import 'package:e_commerce_app/features/splash/presentation/view/widgets/onboarding_body.dart';
import 'package:flutter/material.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingBody(
        image: 'assets/splash_images/onboarding_2.svg',
        title: 'assets/splash_images/Stay In The Know With Shopivia.svg',
        desc: 'assets/splash_images/desc2.svg',
        buttonTitle: 'Start Shopping',
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WelcomePage()));
        },
        isLast: true,
      ),
    );
  }
}