import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdressInfo extends StatelessWidget {
  const AdressInfo({
    super.key,
    required this.address,
    required this.city,
    required this.country,
  });
  final String address;
  final String city;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12, width: 0.4),
      ),

      child: Row(
        children: [
          Icon(
            CupertinoIcons.location_circle_fill,
            color: Colors.redAccent,
            size: 30,
          ),
          SizedBox(width: 12),
          Icon(Icons.arrow_forward_ios, color: Colors.redAccent, size: 12),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$city, $country',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                address,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
