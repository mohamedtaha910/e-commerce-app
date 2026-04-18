import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Shimmer(
            gradient: LinearGradient(colors: [
              Colors.grey.shade200 ,
              Colors.grey.shade100 ,
      
            ]),
            child: Container(
              width: 80,
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 6),
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
            
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        },
      ),
    );
  }
}
