import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomNoItem extends StatelessWidget {
  const CustomNoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: SvgPicture.asset('assets/icons/no_items.svg',)),
        SizedBox(height: 24),
        Text(
          'No Item Found !',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
