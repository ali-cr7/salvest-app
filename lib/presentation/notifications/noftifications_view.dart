import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/presentation/notifications/widgets/notification_item.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/router.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        "mainText": "Your investment has been received!",
        "secondText": "Your investment in Lattakia Chalet has been received.",
        "color": AppColors.green15,
        "imageIcon": AppAssets.walletICon,
      },
      {
        "mainText": "New Property Available!",
        "secondText": "Check out the new properties listed this week.",
        "color": AppColors.green15,
        "imageIcon": AppAssets.negotiationICon,
      },
      {
        "mainText": "Withdrawal Processed",
        "secondText": "Your recent withdrawal request has been completed.",
        "color": AppColors.lightBlue,
        "imageIcon": AppAssets.tourIcon,
      },
      {
        "mainText": "Your investment has been received!",
        "secondText": "Your investment in Lattakia Chalet has been received.",
        "color": AppColors.green15,
        "imageIcon": AppAssets.walletICon,
      },
      {
        "mainText": "Your investment has been received!",
        "secondText": "Your investment in Lattakia Chalet has been received.",
        "color": AppColors.green15,
        "imageIcon": AppAssets.walletICon,
      },
      {
        "mainText": "Your investment has been received!",
        "secondText": "Your investment in Lattakia Chalet has been received.",
        "color": AppColors.green15,
        "imageIcon": AppAssets.walletICon,
      },
      {
        "mainText": "Withdrawal Processed",
        "secondText": "Your recent withdrawal request has been completed.",
        "color": AppColors.lightBlue,
        "imageIcon": AppAssets.tourIcon,
      },
      {
        "mainText": "Withdrawal Processed",
        "secondText": "Your recent withdrawal request has been completed.",
        "color": AppColors.lightBlue,
        "imageIcon": AppAssets.tourIcon,
      },
      {
        "mainText": "Withdrawal Processed",
        "secondText": "Your recent withdrawal request has been completed.",
        "color": AppColors.lightBlue,
        "imageIcon": AppAssets.tourIcon,
      },
      {
        "mainText": "Withdrawal Processed",
        "secondText": "Your recent withdrawal request has been completed.",
        "color": AppColors.lightBlue,
        "imageIcon": AppAssets.tourIcon,
      },
      {
        "mainText": "Withdrawal Processed",
        "secondText": "Your recent withdrawal request has been completed.",
        "color": AppColors.lightBlue,
        "imageIcon": AppAssets.tourIcon,
      },
      {
        "mainText": "Withdrawal Processed",
        "secondText": "Your recent withdrawal request has been completed.",
        "color": AppColors.lightBlue,
        "imageIcon": AppAssets.tourIcon,
      },
      {
        "mainText": "Withdrawal Processed",
        "secondText": "Your recent withdrawal request has been completed.",
        "color": AppColors.lightBlue,
        "imageIcon": AppAssets.tourIcon,
      },
      {
        "mainText": "Your investment has been received!",
        "secondText": "Your investment in Lattakia Chalet has been received.",
        "color": AppColors.green15,
        "imageIcon": AppAssets.walletICon,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 12),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            child: InkWell(
              onTap: () {
                if (item["imageIcon"] == AppAssets.negotiationICon) {
                  GoRouter.of(
                    context,
                  ).push(AppRouter.kNegotiationNotificationView);
                }
              },
              child: NotificationItem(
                mainText: item["mainText"],
                secondText: item["secondText"],
                color: item["color"],
                imageICon: item["imageIcon"],
              ),
            ),
          );
        },
      ),
    );
  }
}
//NegotiationNotification 