import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNoNetwork extends StatelessWidget {
  const CustomNoNetwork({super.key, required this.errorMessage});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Spacer(),
        const SizedBox(height: 280),
        Icon(
          CupertinoIcons.wifi_exclamationmark,
          size: 50,
          color: Colors.black54,
        ),

        Text(
          errorMessage,
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
        ),
        // Spacer(),
        const SizedBox(height: 300),
      ],
    );
  }
}
