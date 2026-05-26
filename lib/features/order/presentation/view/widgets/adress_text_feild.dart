import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdressTextFeild extends StatelessWidget {
  const AdressTextFeild({
    super.key,
    required this.label,
    required this.maxLines,
    required this.borderRadius,
    this.onChanged,
  });
  final String label;
  final int maxLines;
  final double borderRadius;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        // fontWeight: FontWeight.w500,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        return null;
      },
      onChanged: onChanged,
      maxLines: maxLines,
      maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        hint: Text(
          'Enter your $label',
          style: TextStyle(
            color: Colors.black45,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.start,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 0.4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
        ),
      ),
    );
  }
}
