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
      ),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.info_circle_fill,
            color: Colors.blueAccent,
            // size: 30,
          ),
          SizedBox(width: 12),
          Text(id, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
