// import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/splash/presentation/view/onboarding_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Onboarding1(),));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 121, 86),
      // backgroundColor: AppColors.secondaryColor,
      body: Stack(
        children: [
          Positioned(
            top: 6,
            child: SvgPicture.asset('assets/splash_images/Ellipse 1.svg'),
          ),
          Positioned(
            top: 130,
            child: SvgPicture.asset('assets/splash_images/Ellipse 2.svg'),
          ),
          Positioned(
            top: 70,
            child: SvgPicture.asset('assets/splash_images/Ellipse 3.svg'),
          ),
          Positioned(
            top:MediaQuery.of(context).size.height * 0.45,
            left: MediaQuery.of(context).size.width * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/logo.svg' , ),
                const SizedBox(width: 10),
                // Text('Shoppivia', style: TextStyle(fontSize: 24, color: Colors.white , fontWeight: FontWeight.bold),)
                SvgPicture.asset('assets/splash_images/Shopivia.svg' , width: 130,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
