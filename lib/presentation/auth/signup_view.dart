import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/business_logic/user/bloc/user_bloc.dart';
import 'package:salvest_app/presentation/auth/widgets/custom_button.dart';
import 'package:salvest_app/presentation/auth/widgets/custom_textfield.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/dialogs_snackBar.dart';
import 'package:salvest_app/utility/router.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confimPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPurple,
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserLoggedState) {
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
            Positioned(
              top: 0,
              child: SvgPicture.asset(
                'assets/images/login_background.svg',
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                child: Container(
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
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
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
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                            ),
                            const Text(
                              "Sign Up",
                              style: TextStyle(
                                color: AppColors.black46,
                                fontSize: 26,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        CustomTextField(
                          controller: userNameController,
                          hintText: "UserName",
                          icon: Icons.person,
                        ),
                        const SizedBox(height: 15),
                        CustomTextField(
                          controller: emailController,
                          hintText: "Email",
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 15),
                        CustomTextField(
                          controller: passwordController,
                          hintText: "Password",
                          icon: Icons.lock,
                          isPassword: true,
                        ),
                        const SizedBox(height: 15),
                        CustomTextField(
                          controller: confimPasswordController,
                          hintText: "Confirm Password",
                          icon: Icons.lock,
                          isPassword: true,
                        ),
                        const SizedBox(height: 15),
                        CustomTextField(
                          controller: phoneNumberController,
                          hintText: "Number",
                          icon: Icons.phone,
                        ),
                        const SizedBox(height: 44),
                        BlocBuilder<UserBloc, UserState>(
                          builder: (context, state) {
                            return CustomButton(
                              isLoading: state is UserLoading,
                              text: "Sign Up",
                              onPressed: () {
                                context.read<UserBloc>().add(
                                  SignUpEvent(
                                    password: passwordController.text,
                                    phoneNumber: phoneNumberController.text,
                                    email: emailController.text,
                                    fullName: userNameController.text,
                                    verificationCode:
                                        confimPasswordController.text,
                                  ),
                                );
                              }, // Implement sign-up logic
                            );
                          },
                        ),
                      ],
                    ),
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
