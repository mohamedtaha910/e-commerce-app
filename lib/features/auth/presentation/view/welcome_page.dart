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
                height: MediaQuery.of(context).size.height * 0.685,
                width: MediaQuery.of(context).size.width,
                child: ShaderMask(
                  blendMode: BlendMode
                      .srcIn, // Ensures the gradient only fills the SVG shape
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color.fromARGB(255, 216, 94, 13),
                        AppColors.primaryColor.withAlpha(180),
                        const Color.fromARGB(255, 216, 94, 13),
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
                top: 42,
                left: 15,
                right: 10,
                child: SvgPicture.asset(
                  'assets/auth_images/login.svg',
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * 0.48,
                  // width: 130,
                ),
              ),
              Positioned(
                top: 42,
                left: 16,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,

                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black26, width: 0.4),
                    ),
                    child: Icon(
                      Icons.chevron_left_rounded,
                      color: Colors.black54,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Transform.translate(
            offset: Offset(0, -20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/auth_images/Welcome.svg'),
                  const SizedBox(height: 32),
                  Text(
                    'Join thousands of happy shoppers. It’s fast, free, and only takes a few seconds!',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // const SizedBox(height: 8),
          Spacer(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}
