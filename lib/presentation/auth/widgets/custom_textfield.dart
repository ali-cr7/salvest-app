import 'package:flutter/material.dart';
import 'package:salvest_app/utility/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.black38),
        // prefixIcon: Icon(icon, color: Colors.grey),
        suffixIcon:
            isPassword
                ? Icon(Icons.visibility_off, color: Colors.grey)
                : Icon(icon, color: Colors.grey),
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
