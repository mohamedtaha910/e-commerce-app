import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/features/auth/presentation/view/log_in_page.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/custom_auth_text_feild.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/custom_header.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/custom_shift.dart';
import 'package:e_commerce_app/features/auth/presentation/view/widgets/other_way.dart';
import 'package:e_commerce_app/features/splash/presentation/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeader(
              image: 'assets/auth_images/frame.svg',
              text: 'assets/auth_images/Sign_Up_word.svg',
            ),
            SizedBox(height: 16),
            AuthTextFeild(
              hintText: 'Email',
              icon: Icons.email,
              onChanged: (value) {},
              borderRadius: 25,
              obscureText: false,
            ),
            SizedBox(height: 16),
            AuthTextFeild(
              hintText: 'Password',
              icon: Icons.lock,
              onChanged: (value) {},
              borderRadius: 25,
              obscureText: true,
            ),
            SizedBox(height: 32),
            CustomButton(
              color: AppColors.primaryColor,
              textColor: Colors.white,
              title: 'Sign Up',
              verticalPadding: 10,
              horizontalMargin: 16,
              onTap: () {},
            ),
            SizedBox(height: 16),
            OtherWay(),
            SizedBox(height: 16),
            CustomShift(
              destination: LoginPage(),
              text: 'Log In',
              text2: 'Already have an account?  ',
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
