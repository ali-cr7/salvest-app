import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:salvest_app/utility/app_colors.dart';

class OwneredCertificationItemShimmer extends StatelessWidget {
  const OwneredCertificationItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.green15,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildShimmerLine(icon: Icons.location_on_outlined),
            const SizedBox(height: 8),
            _buildShimmerLine(icon: Icons.confirmation_number_outlined),
            const SizedBox(height: 8),
            _buildShimmerLine(icon: Icons.attach_money),
            const SizedBox(height: 12),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerLine({required IconData icon}) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.black.withOpacity(0.2)),
        const SizedBox(width: 8),
        Container(
          height: 14,
          width: 200,
          color: Colors.white,
        ),
      ],
    );
  }
}
