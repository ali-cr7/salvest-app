import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:salvest_app/utility/app_colors.dart';

class WithdrawlRequestItemShimmer extends StatelessWidget {
  const WithdrawlRequestItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.green15,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top Row: Amount + Status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  shimmerBox(width: 80, height: 16),
                  shimmerBox(width: 60, height: 20, borderRadius: 12),
                ],
              ),
              const SizedBox(height: 8),

              /// Method + Requested
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  shimmerBox(width: 100, height: 14),
                  shimmerBox(width: 120, height: 12),
                ],
              ),
              const Divider(height: 20),

              /// Method Details (3 lines)
              shimmerBox(width: double.infinity, height: 12),
              const SizedBox(height: 6),
              shimmerBox(width: double.infinity, height: 12),
              const SizedBox(height: 6),
              shimmerBox(width: 150, height: 12),

              /// Transaction ref
              const SizedBox(height: 12),
              shimmerBox(width: 180, height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget shimmerBox({
    double width = double.infinity,
    double height = 16,
    double borderRadius = 8,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
