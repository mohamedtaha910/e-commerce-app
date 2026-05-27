import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomNoItem extends StatelessWidget {
  const CustomNoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: SvgPicture.asset('assets/icons/no_items.svg')),
        SizedBox(height: 20),
        Text(
          'No Products Found !',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
