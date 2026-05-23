import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class AuthTextFeild extends StatefulWidget {
  const AuthTextFeild({
    super.key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.borderRadius,
    required this.obscureText,
    this.paddign = 16,
    this.height = 12,
  });
  final String hintText;
  final IconData icon;
  final void Function(String)? onChanged;
  final double borderRadius;
  final bool obscureText;
  final double paddign;
  final double? height;

  @override
  State<AuthTextFeild> createState() => _AuthTextFeildState();
}

class _AuthTextFeildState extends State<AuthTextFeild> {
  late bool isHidden;
  @override
  void initState() {
    isHidden = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.paddign),
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return 'feild is required';
          } else if (widget.hintText == 'Password' && data.length < 6) {
            return 'password must be at least 6 characters';
          } else {
            return null;
          }
        },
        scrollPadding: EdgeInsets.symmetric(horizontal: 16),
        onChanged: widget.onChanged,
        obscureText: isHidden,

        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: widget.height!,
            horizontal: 16,
          ),
          suffix: GestureDetector(
            onTap: () {
              setState(() {
                isHidden = !isHidden;
              });
            },
            child: Icon(
              isHidden ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
          ),

          fillColor: Colors.grey.withOpacity(0.1),
          filled: true,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, color: Colors.grey, size: 20),
              SizedBox(width: 8),
              Text(
                widget.hintText,
                style: TextStyle(color: Colors.black45, fontSize: 14),
              ),
            ],
          ),

          // hintText: hintText,
          // hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
      ),
    );
  }
}
