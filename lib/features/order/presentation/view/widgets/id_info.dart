import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IdInfo extends StatelessWidget {
  const IdInfo({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12, width: 0.4),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.shade200,
        //     blurRadius: 4,
        //     offset: (Offset(0, 2)),
        //     spreadRadius: 1,
        //     // blurStyle: BlurStyle.outer,
        //   ),
        // ],
      ),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.info_circle_fill,
            color: Colors.blueAccent,
            size: 27,
            // size: 30,
          ),
          SizedBox(width: 12),
          Icon(Icons.arrow_forward_ios, color: Colors.blueAccent, size: 12),
          SizedBox(width: 12),
          Text(id, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
