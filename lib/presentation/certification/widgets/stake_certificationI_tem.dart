import 'package:flutter/material.dart';
import 'package:salvest_app/utility/app_colors.dart';

class OwneredCertificationItem extends StatelessWidget {
  const OwneredCertificationItem({
    super.key,
    required this.location,
    required this.chances,
    required this.amount,
    required this.onTransferPressed,
  });

  final String location;
  final int chances;
  final String amount;
  final VoidCallback onTransferPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.green15,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow(
            icon: Icons.location_on_outlined,
            label: 'Location',
            value: location,
          ),
          const SizedBox(height: 8),
          _buildInfoRow(
            icon: Icons.confirmation_number_outlined,
            label: 'Chances Owned',
            value: chances.toString(),
          ),
          const SizedBox(height: 8),
          _buildInfoRow(
            icon: Icons.attach_money,
            label: 'Amount Paid',
            value: '\$$amount',
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: onTransferPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: const Text("Transfer Ownership"),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.black87),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            "$label: $value",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
