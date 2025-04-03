import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/presentation/profile/widgets/profile_info_row.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Padding(
            padding: const EdgeInsets.only(left: 48.0),
            child: Row(
              spacing: 35,
              children: [
                Container(
                  width: 103,
                  height: 103,
                  decoration: ShapeDecoration(
                    color: const Color(0x669A8AEC),
                    shape: OvalBorder(
                      side: BorderSide(
                        width: 4,
                        color: const Color(0xFF836DF3),
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'AM',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ali Mossa',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'joined in 2 April 2020',
                      style: TextStyle(
                        color: Colors.black.withValues(alpha: 135),
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            width: 349,
            height: 217,
            decoration: ShapeDecoration(
              color: const Color(0x3F9A8AEC),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 3, color: const Color(0xFF836DF3)),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
              child: Column(
                children: [
                  ProfileInfoRow(
                    icon: AppAssets.messageIcon,
                    text: 'email.email@gmail.com',
                    onTap: () {},
                  ),
                  SizedBox(height: 10),
                  ProfileInfoRow(
                    icon: AppAssets.phoneIcon,
                    text: '+963 9933445588',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
