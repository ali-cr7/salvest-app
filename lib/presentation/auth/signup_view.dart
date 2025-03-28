import 'package:flutter/material.dart';
import 'package:salvest_app/presentation/auth/widgets/custom_button.dart';
import 'package:salvest_app/presentation/auth/widgets/custom_textfield.dart';
import 'package:salvest_app/utility/app_colors.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
                  const Text("Sign in", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const CustomTextField(hintText: "Email", icon: Icons.email),
                  const SizedBox(height: 15),
                  const CustomTextField(hintText: "Password", icon: Icons.lock, isPassword: true),
                  const SizedBox(height: 15),
                  const CustomTextField(hintText: "Confirm Password", icon: Icons.lock, isPassword: true),
                  const SizedBox(height: 15),
                  const CustomTextField(hintText: "Number", icon: Icons.phone),
                  CustomButton(
                    text: "Sign in",
                    onPressed: () {}, // Implement sign-up logic
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
