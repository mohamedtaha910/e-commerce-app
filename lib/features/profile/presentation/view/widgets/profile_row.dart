import 'package:flutter/material.dart';

class ProfileRow extends StatelessWidget {
  const ProfileRow({
    super.key,
    required this.textColor,
    required this.text,
    required this.icon,
    this.onTap,
    required this.iconColor,
    required this.circleColor,
    required this.arrowColor,
  });
  final Color textColor;
  final String text;
  final IconData icon;
  final void Function()? onTap;
  final Color iconColor;
  final Color circleColor;
  final Color arrowColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 12),
        Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            decoration: BoxDecoration(
              color: circleColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(Icons.arrow_forward_ios, color: arrowColor, size: 14),
          ),
        ),
      ],
    );
  }
}
