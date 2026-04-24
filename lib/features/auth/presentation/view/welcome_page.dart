import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/auth/presentation/view/log_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: ShaderMask(
                  blendMode: BlendMode
                      .srcIn, // Ensures the gradient only fills the SVG shape
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.primaryColor.withAlpha(150),
                        Colors.purple.withAlpha(150),
                      ],
                    ).createShader(bounds);
                  },
                  child: SvgPicture.asset(
                    'assets/auth_images/header1.svg',
                    // color: const Color.fromARGB(255, 198, 172, 151),
                    // color: AppColors.secondaryColor.withAlpha(120),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 15,
                child: SvgPicture.asset(
                  'assets/auth_images/login.svg',
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * 0.48,
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
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SvgPicture.asset('assets/auth_images/Welcome.svg'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Join thousands of happy shoppers. It’s fast, free, and only takes a few seconds!',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Spacer(),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 6),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: SvgPicture.asset('assets/auth_images/continue.svg'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
