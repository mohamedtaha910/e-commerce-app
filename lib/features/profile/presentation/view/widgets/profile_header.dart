import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // const SizedBox(width: 16),
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey.shade400,
          child: CircleAvatar(
            radius: 58,
            child: Image.asset('assets/images/user2.png'),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              FirebaseAuth.instance.currentUser?.email!.split('@')[0] ??
                  'UnKnown User',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              FirebaseAuth.instance.currentUser?.email ??
                  'UnKnown Use@example.com',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ],
    );
  }
}
