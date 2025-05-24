import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/business_logic/user/bloc/user_bloc.dart';
import 'package:salvest_app/presentation/auth/widgets/custom_button.dart';
import 'package:salvest_app/presentation/auth/widgets/custom_textfield.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/dialogs_snackBar.dart';
import 'package:salvest_app/utility/handle_cash.dart';
import 'package:salvest_app/utility/router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPurple,
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) async {
          if (state is UserLoginState) {
            GoRouter.of(context).push(AppRouter.kHomePageView);
          } 
          if (state is UserErrorState) {
            DialogsWidgetsSnackBar.showSnackBarFromStatus(
              context: context,
              helperResponse: state.helperResponse,
              showServerError: true,
            );
          }
        },
        
        child: Stack(
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
                      CustomTextField(
                        controller: emailController,
                        hintText: "Email or number",
                        icon: Icons.email_outlined,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),

                      /// Password Input
                      CustomTextField(
                        controller: passwordController,
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
                      BlocBuilder<UserBloc, UserState>(
                        builder: (context, state) {
                          return CustomButton(
                            isLoading: state is UserLoading,
                            text: "Login",
                            onPressed: () {
                              context.read<UserBloc>().add(
                                LogInEvent(
                                  password: passwordController.text,
                                  email: emailController.text,
                                ),
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),

                      /// Signup Redirect
                      Center(
                        child: TextButton(
                          onPressed: () {
                            GoRouter.of(
                              context,
                            ).push(AppRouter.kSignupView);
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
      ),
    );
  }
}
