import 'package:flutter/material.dart';
import 'package:salvest_app/utility/app_colors.dart';

class WalletButton extends StatelessWidget {
  const WalletButton({super.key, required this.text, required this.iconData});
  final String text;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 25.29,
          height: 25,
          decoration: ShapeDecoration(
            color: Colors.black.withValues(alpha: 209),
            shape: OvalBorder(),
          ),
          child: Icon(iconData, color: AppColors.background),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 10,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
