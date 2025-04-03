import 'package:flutter/material.dart';
import 'package:salvest_app/utility/app_assests.dart';

class ProfileInfoRow extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback onTap;

  const ProfileInfoRow({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image(image: AssetImage(icon)),
          const SizedBox(width: 24),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Image(image: AssetImage(AppAssets.editIcon)),
          ),
        ],
      ),
    );
  }
}