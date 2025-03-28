import 'package:flutter/material.dart';
import 'package:salvest_app/presentation/auth/widgets/custom_button.dart';
import 'package:salvest_app/presentation/auth/widgets/custom_textfield.dart';
import 'package:salvest_app/utility/app_colors.dart' show AppColors;

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPurple,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Reset Password", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const CustomTextField(hintText: "New Password", icon: Icons.lock, isPassword: true),
                  const SizedBox(height: 15),
                  const CustomTextField(hintText: "Confirm New Password", icon: Icons.lock, isPassword: true),
                  CustomButton(
                    text: "Reset",
                    onPressed: () {}, // Implement reset logic
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
