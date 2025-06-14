import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:salvest_app/constants.dart';
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // alignment: Alignment.topCenter,
                  // clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: _buildCrownWidget('platinum'),
                    ),

                    // 👤 Profile initials badg
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
                          getInitials(name!),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60),
                    Text(
                      name!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      formatJoinedDate(joinDate!),
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
                    text: email!,
                    onTap: () {},
                  ),
                  SizedBox(height: 10),
                  ProfileInfoRow(
                    icon: AppAssets.phoneIcon,
                    text: phone!,
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

  String formatJoinedDate(String isoDate) {
    try {
      // Parse the ISO date string into a DateTime object
      DateTime date = DateTime.parse(isoDate);

      // Format the date as "d MMMM yyyy" (e.g., "14 April 2025")
      String formattedDate = DateFormat('d MMMM yyyy').format(date);

      return 'joined in $formattedDate';
    } catch (e) {
      // Fallback if parsing fails
      return 'joined in Unknown date';
    }
  }

  String getInitials(String fullName) {
    if (fullName.isEmpty) return "";

    List<String> parts =
        fullName.trim().split(' ').where((s) => s.isNotEmpty).toList();

    String firstInitial = parts.isNotEmpty ? parts.first[0] : '';
    String lastInitial = parts.length > 1 ? parts.last[0] : '';

    return (firstInitial + lastInitial).toUpperCase();
  }
}

Widget _buildCrownWidget(String tier) {
  Color crownColor;

  switch (tier.toLowerCase()) {
    case 'silver':
      crownColor = const Color(0xFFC0C0C0); // Silver
      break;
    case 'gold':
      crownColor = const Color(0xFFFFD700); // Gold
      break;
    case 'platinum':
      crownColor = const Color(0xFFB0E0E6); // Platinum
      break;
    default:
      crownColor = Colors.grey;
  }

  return Icon(
    FontAwesomeIcons.crown, // Trophy icon as placeholder crown
    color: crownColor,
    size: 80,
  );
}
