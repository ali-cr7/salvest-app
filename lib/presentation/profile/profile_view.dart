
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
    // نرسل الحدث عند إنشاء الصفحة
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          // صف التاج + الصورة
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Row(
              children: [
                // العمود الذي فيه التاج وصورة البروفايل
                Column(
                  children: [
                    BlocBuilder<LargestRewardBloc, LargestRewardState>(
                      builder: (context, state) {
                        if (state is LargestRewardLoading ||
                            state is LargestRewardInitial) {
                          // أثناء التحميل: سبنر بدل التاج
                          return const SizedBox(
                            height: 80,
                            width: 80,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                        Color crownColor;
                        //   String subtitle; // إما أعلى ربح أو رسالة خطأ
                        if (state is LargestRewardLoaded) {
                          final tier = state.reward.level ?? '';
                          // نختار اللون بناءً على المستوى
                          switch (tier.toLowerCase()) {
                            case 'silver':
                              crownColor = const Color(0xFFC0C0C0);
                              break;
                            case 'gold':
                              crownColor = const Color(0xFFFFD700);
                              break;
                            case 'platinum':
                              crownColor = const Color(0xFFB0E0E6);
                              break;
                            default:
                              crownColor = Colors.grey;
                          }
                          //   subtitle = ' ${state.reward.amountProfit}%';
                          // } else if (state is LargestRewardError) {
                          //   crownColor = Colors.grey; // حالة الخطأ
                          //   subtitle = 'خطأ في التحميل';
                        } else {
                          crownColor = Colors.grey;
                          // subtitle = '';
                        }

                        return Column(
                          children: [
                            Icon(
                              FontAwesomeIcons.crown,
                              color: crownColor,
                              size: 80,
                            ),
                            const SizedBox(height: 8),
                            // Text(
                            // subtitle,
                            // style: const TextStyle(
                            //   fontSize: 14,
                            //   fontWeight: FontWeight.w500,
                            //   color: Colors.black87,
                            // ),
                            // ),
                          ],
                        );
                      },
                    ),

                    const SizedBox(height: 0),

                    // صورة البروفايل (ثابتة كما في التصميم)
                    Container(
                      width: 103,
                      height: 103,
                      decoration: ShapeDecoration(
                        color: const Color(0x669A8AEC),
                        shape: const OvalBorder(
                          side: BorderSide(width: 4, color: Color(0xFF836DF3)),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          getInitials(name!),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 35),

                // بيانات المستخدم (الاسم وتاريخ الانضمام)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    Text(
                      name!,
                      style: const TextStyle(
                        color: Colors.black,
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
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // بطاقة المعلومات (إيميل + هاتف)
          Container(
            width: 349,
            height: 217,
            decoration: ShapeDecoration(
              color: const Color(0x3F9A8AEC),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 3, color: Color(0xFF836DF3)),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
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
          ),
        ],
      ),
    );
  }

  String formatJoinedDate(String isoDate) {
    try {
      final date = DateTime.parse(isoDate);
      final formatted = DateFormat('d MMMM yyyy').format(date);
      return 'joined in $formatted';
    } catch (_) {
      return 'joined in Unknown date';
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
