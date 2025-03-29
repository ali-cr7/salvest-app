import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/presentation/auth/widgets/custom_button.dart';
import 'package:salvest_app/presentation/auth/widgets/custom_textfield.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/router.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPurple,
      body: Stack(
        children: [
          /// Background Image (Full Screen)
          Positioned(
            top: 0,
            child: SvgPicture.asset(
              'assets/images/background.svg', // Ensure correct path
              fit: BoxFit.contain,
            ),
          ),

          /// Content (Half of Screen)
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.55,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Email Input
                    const CustomTextField(
                      hintText: "Email or number",
                      icon: Icons.email_outlined,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                    /// Password Input
                    const CustomTextField(
                      hintText: "Password",
                      icon: Icons.visibility_off,
                      //  isPassword: true,
                    ),

                    /// Forget Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          GoRouter.of(
                            context,
                          ).push(AppRouter.kForgotPasswordView);
                        },
                        child: const Text(
                          "Forget password?",
                          style: TextStyle(
                            color: AppColors.lightPurple,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),

                    /// Login Button
                    CustomButton(text: "Login", onPressed: () {}),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                    /// Signup Redirect
                    Center(
                      child: TextButton(
                        onPressed: () {
                          GoRouter.of(context).push(AppRouter.kSignupView);
                        },
                        child: const Text.rich(
                          TextSpan(
                            text: "Don’t have an account? ",
                            style: TextStyle(color: Colors.black54),
                            children: [
                              TextSpan(
                                text: "Sign up",
                                style: TextStyle(
                                  color: AppColors.lightPurple,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
