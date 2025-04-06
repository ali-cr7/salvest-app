import 'package:flutter/material.dart';
import 'package:salvest_app/utility/app_colors.dart';

class CustomSendButton extends StatelessWidget {
  const CustomSendButton({
    super.key,
    required this.onTap,
    required this.buttonName,
  });
  final VoidCallback onTap;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 350,
        height: 44,
        decoration: ShapeDecoration(
          color: AppColors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
