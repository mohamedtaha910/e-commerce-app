import 'package:flutter/material.dart';

class DescribtionSection extends StatelessWidget {
  const DescribtionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Describtion',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Lorem ipsum dolor sit amet consectetur. Ornare massa odio mauris aliquet lectus tincidunt viverra. Justo cursus fringilla quam quisque pretium. Amet quis nulla viverra aliquam.',
          style: TextStyle(color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}