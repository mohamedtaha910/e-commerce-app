import 'package:e_commerce_app/features/home/presentation/view/home_page_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomePageBody(),
    );
  }
}