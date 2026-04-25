import 'package:flutter/material.dart';

class CustomStartSearch extends StatelessWidget {
  const CustomStartSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset('assets/icons/search_.jpg', height: 180),
        ),
        const SizedBox(height: 40),
        Text(
          'Search For a Products',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
    ;
  }
}
