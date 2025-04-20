import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FAQShimmerItem extends StatelessWidget {
  const FAQShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            gradient: LinearGradient(
              colors: [
                Color(0xFFB8A9F2),
                Color(0xFFA393EB),
                Color(0xFF8C7EDC),
                Color(0xFF7769C5),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
        ),
      ),
    );
  }
}
