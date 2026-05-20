import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCartEmpty extends StatelessWidget {
  const CustomCartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset('assets/icons/cart_empty2.png', width: 175),
              Positioned(
                top: 24,
                right: 0,
                bottom: 0,
                left: 50,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.orange.withAlpha(30),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Your Cart is Empty ! ',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
