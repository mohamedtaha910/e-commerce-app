import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchTextFeild extends StatelessWidget {
  const CustomSearchTextFeild({super.key, this.onChanged});
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.primaryColor,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,

        fillColor: Colors.grey.shade200,
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: SvgPicture.asset(
            'assets/icons/search.svg',
            height: 22,
            color: Colors.black54,
          ),
        ),
        suffixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Icon(Icons.mic, size: 24, color: Colors.black54),
        ),
        hintText: 'Search ',
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black54,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.black38, width: 0.2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.black38, width: 0.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.black54, width: 0.4),
        ),
      ),
    );
  }
}
