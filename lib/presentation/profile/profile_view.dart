import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:salvest_app/business_logic/largest%20reward%20bloc/largest_reward_bloc.dart';
import 'package:salvest_app/business_logic/largest%20reward%20bloc/largest_reward_event.dart';
import 'package:salvest_app/business_logic/largest%20reward%20bloc/largest_reward_state.dart';
import 'package:salvest_app/constants.dart';
import 'package:salvest_app/presentation/profile/widgets/profile_info_row.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LargestRewardBloc>().add(FetchLargestRewardEvent());

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: SingleChildScrollView(
          // ✅ Scrollable if too long
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),

              // ===== PROFILE HEADER =====
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Column(
                      children: [
                        BlocBuilder<LargestRewardBloc, LargestRewardState>(
                          builder: (context, state) {
                            Color crownColor = Colors.grey;
                            if (state is LargestRewardLoaded) {
                              switch (state.reward.level?.toLowerCase()) {
                                case 'silver':
                                  crownColor = const Color(0xFFC0C0C0);
                                  break;
                                case 'gold':
                                  crownColor = const Color(0xFFFFD700);
                                  break;
                                case 'platinum':
                                  crownColor = const Color.fromARGB(
                                    255,
                                    33,
                                    86,
                                    93,
                                  );
                                  break;
                              }
                            }
                            return Icon(
                              FontAwesomeIcons.crown,
                              color: crownColor,
                              size: 80,
                            );
                          },
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: ShapeDecoration(
                            color: const Color(0x669A8AEC),
                            shape: const OvalBorder(
                              side: BorderSide(
                                width: 4,
                                color: Color(0xFF836DF3),
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              getInitials(name!),
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 24),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            formatJoinedDate(joinDate!),
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.53),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ===== CONTACT INFO CARD =====
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0x3F9A8AEC),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF836DF3), width: 3),
                ),
                child: Column(
                  children: [
                    ProfileInfoRow(
                      icon: AppAssets.messageIcon,
                      text: email!,
                      onTap: () {},
                    ),
                    const SizedBox(height: 10),
                    ProfileInfoRow(
                      icon: AppAssets.phoneIcon,
                      text: phone!,
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ===== REWARD SYSTEM EXPLANATION =====
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0x3F9A8AEC),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF836DF3), width: 3),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "🎯 Reward System",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Silver Level
                    rewardRow(
                      FontAwesomeIcons.crown,
                      "Silver",
                      "Spend ≥ 1,000,000.00 to get 2% cashback & 4% discount (4 times)",
                      iconColor: const Color(0xFFC0C0C0), // silver
                    ),
                    const SizedBox(height: 8),

                    // Gold Level
                    rewardRow(
                      FontAwesomeIcons.crown,
                      "Gold",
                      "Spend ≥ 2,000,000.00 to get 3% cashback & 5% discount (4 times)",
                      iconColor: const Color(0xFFFFD700), // gold
                    ),
                    const SizedBox(height: 8),

                    // Platinum Level
                    rewardRow(
                      FontAwesomeIcons.crown,
                      "Platinum",
                      "Spend ≥ 3,000,000.00 to get 5% cashback & 6% discount (4 times)",
                      iconColor: const Color.fromARGB(
                        255,
                        33,
                        86,
                        93,
                      ), // platinum
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rewardRow(
    IconData icon,
    String title,
    String desc, {
    Color iconColor = Colors.white,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: iconColor, size: 28),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                desc,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String formatJoinedDate(String isoDate) {
    try {
      final date = DateTime.parse(isoDate);
      return 'Joined in ${DateFormat('d MMMM yyyy').format(date)}';
    } catch (_) {
      return 'Joined in Unknown date';
    }
  }

  String getInitials(String fullName) {
    final parts =
        fullName.trim().split(' ').where((s) => s.isNotEmpty).toList();
    final first = parts.isNotEmpty ? parts.first[0] : '';
    final last = parts.length > 1 ? parts.last[0] : '';
    return (first + last).toUpperCase();
  }
}
