import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/presentation/auth/widgets/custom_button.dart';
import 'package:salvest_app/presentation/auth/widgets/custom_textfield.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/router.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPurple,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: SvgPicture.asset(
              'assets/images/login_background.svg', // Ensure correct path
              fit: BoxFit.contain,
            ),
          ),

          Positioned(
            bottom: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7,
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            GoRouter.of(context).push('/');
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.black46,
                          ),
                        ),

                        SizedBox(width: 10),
                        const Text(
                          "Forget Password",

                          style: TextStyle(
                            color: AppColors.black46,
                            fontSize: 26,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    const CustomTextField(
                      hintText: "Enter Code",
                      icon: Icons.code,
                      isPassword: false,
                    ),

                    const SizedBox(height: 44),
                    CustomButton(
                      text: "Check",
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kResetPasswordView);
                      }, // Implement sign-up logic
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
