import 'package:flutter/material.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/app_assests.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.mainText,
    required this.secondText,
    required this.notificationType,
  });

  final String mainText;
  final String secondText;
  final String notificationType;

  @override
  Widget build(BuildContext context) {
    final notificationDesign = _getDesignByType(notificationType);
    final Color color = notificationDesign['color']!;
    final String imageIcon = notificationDesign['icon']!;

    return Container(
      width: 345,
      height: 56,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Colors.black.withAlpha(117)),
          borderRadius: BorderRadius.circular(7),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Row(
          children: [
            Image.asset(imageIcon, width: 24, height: 24, fit: BoxFit.contain),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mainText,
                    style: const TextStyle(color: Colors.black87, fontSize: 16),
                  ),
                  Flexible(
                    child: Text(
                      secondText,
                      style: const TextStyle(
                        color: Colors.black38,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Map notification type to icon and color
  Map<String, dynamic> _getDesignByType(String type) {
    switch (type) {
      case 'investment_process':
      case 'transferFromProfitToInvestment':
      case 'transferToPlatform':
        return {'color': AppColors.green15, 'icon': AppAssets.walletICon};

      case 'create_negotiation':
      case 'update_negotiation':
      case 'reject_negotiation':
      case 'accept_negotiation':
        return {'color': AppColors.green15, 'icon': AppAssets.negotiationICon};

      case 'make_withdrawal_request':
      case 'accept_withdrawal_request':
        return {'color': AppColors.green15, 'icon': AppAssets.cashGreen};

      case 'login_success':
      case 'send_code':
      case 'verify_code_success':
      case 'reset_password':
      case 'activate_auto_investment':
      case 'deactivate_auto_investment':
      case 'create_wallets':
        return {'color': AppColors.gray, 'icon': AppAssets.profileIcon};

      case 'charge_wallet_success':
        return {'color': AppColors.green15, 'icon': AppAssets.walletICon};

      case 'charge_wallet_failed':
      case 'verify_code_failed':
        return {
          'color': Colors.red[100] ?? AppColors.brightRed,
          'icon': AppAssets.cashGreen,
        };

      default:
        return {'color': Colors.grey[200]!, 'icon': AppAssets.appICnon};
    }
  }
}
