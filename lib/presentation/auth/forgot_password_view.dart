import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/business_logic/user/bloc/user_bloc.dart';
import 'package:salvest_app/constants.dart';
import 'package:salvest_app/presentation/auth/widgets/custom_button.dart';
import 'package:salvest_app/presentation/auth/widgets/custom_textfield.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/dialogs_snackBar.dart';
import 'package:salvest_app/utility/router.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  TextEditingController codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPurple,
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserLoading) {
            EasyLoading.show(status: 'loading...');
          }
          if (state is SendVerificationSuccessState) {
            EasyLoading.dismiss();
            EasyLoading.showSuccess('Code Sent successfully!');
            //  GoRouter.of(context).push(AppRouter.kResetPasswordView);
          }
          if (state is UserErrorState) {
            EasyLoading.dismiss();
            DialogsWidgetsSnackBar.showSnackBarFromStatus(
              context: context,
              helperResponse: state.helperResponse, 
              showServerError: true,
            );
          }
          if (state is VerifiySuccessState) {
            EasyLoading.dismiss();
            EasyLoading.showSuccess('Code Sent successfully!');
            GoRouter.of(context).pushReplacement(AppRouter.kResetPasswordView);
          } 
        },
        child: Stack(
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
                        color: Colors.black.withValues(alpha: 0.1),
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

                      CustomTextField(
                        controller: codeController,
                        hintText: "Enter Code",
                        icon: Icons.code,
                        isPassword: false,
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: BlocBuilder<UserBloc, UserState>(
                          builder: (context, state) {
                            final codeSent = state is ResetSuccessState;
                            return Center(
                              child:
                                  codeSent
                                      ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Check your email ',
                                            style: TextStyle(
                                              color: AppColors.black46,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              context.read<UserBloc>().add(
                                                SendVerificationCodeEvent(
                                                  email: email!,
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'Resend',
                                              style: TextStyle(
                                                color: AppColors.lightPurple,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                      : InkWell(
                                        onTap: () async {
                                          context.read<UserBloc>().add(
                                            SendVerificationCodeEvent(
                                              email: email!,
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Send Verification Code',
                                          style: TextStyle(
                                            color: AppColors.lightPurple,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 22),
                      CustomButton(
                        text: "Check",
                        onPressed: () {
                          context.read<UserBloc>().add(
                            VerifyCodeEvent(
                              email: email!,
                              code: codeController.text,
                            ),
                          );
                          // GoRouter.of(
                          //   context,
                          // ).push(AppRouter.kResetPasswordView);
                        }, // Implement sign-up logic
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
