import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SearchedListShimmer extends StatelessWidget {
  const SearchedListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, inedx) {
          return Shimmer(
            gradient: LinearGradient(
              colors: [Colors.grey.shade200, Colors.grey.shade100],
            ),
            child: Container(
              margin: EdgeInsets.only(bottom: 16),
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade50
              ),

            ),
          );
        },
      ),
    );
  }
}
