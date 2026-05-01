import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile' , style: TextStyle(color: Colors.black , fontSize: 20, fontWeight: FontWeight.bold),),
      ),
      body:Column(
        children: [
          Text('Profile'),
        ],
      )
    );
  }
}