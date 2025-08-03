import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/business_logic/user%20notifications%20bloc/user_notifications_bloc.dart';
import 'package:salvest_app/business_logic/withdrawls%20request%20bloc/withdrawls_request_bloc.dart';
import 'package:salvest_app/presentation/notifications/widgets/notificationItem_shimmer.dart';
import 'package:salvest_app/presentation/notifications/widgets/notification_item.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/elevated_button_widget.dart';
import 'package:salvest_app/utility/router.dart';
import 'package:salvest_app/utility/somthing_wrong.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, dynamic>> notifications = [
    //   {
    //     "mainText": "Your investment has been received!",
    //     "secondText": "Your investment in Lattakia Chalet has been received.",
    //     "color": AppColors.green15,
    //     "imageIcon": AppAssets.walletICon,
    //   },
    //   {
    //     "mainText": "New Property Available!",
    //     "secondText": "Check out the new properties listed this week.",
    //     "color": AppColors.green15,
    //     "imageIcon": AppAssets.negotiationICon,
    //   },
    //   {
    //     "mainText": "Withdrawal Processed",
    //     "secondText": "Your recent withdrawal request has been completed.",
    //     "color": AppColors.lightBlue,
    //     "imageIcon": AppAssets.tourIcon,
    //   },
    //   {
    //     "mainText": "Your investment has been received!",
    //     "secondText": "Your investment in Lattakia Chalet has been received.",
    //     "color": AppColors.green15,
    //     "imageIcon": AppAssets.walletICon,
    //   },
    //   {
    //     "mainText": "Your investment has been received!",
    //     "secondText": "Your investment in Lattakia Chalet has been received.",
    //     "color": AppColors.green15,
    //     "imageIcon": AppAssets.walletICon,
    //   },
    //   {
    //     "mainText": "Your investment has been received!",
    //     "secondText": "Your investment in Lattakia Chalet has been received.",
    //     "color": AppColors.green15,
    //     "imageIcon": AppAssets.walletICon,
    //   },
    //   {
    //     "mainText": "Withdrawal Processed",
    //     "secondText": "Your recent withdrawal request has been completed.",
    //     "color": AppColors.lightBlue,
    //     "imageIcon": AppAssets.tourIcon,
    //   },
    //   {
    //     "mainText": "Withdrawal Processed",
    //     "secondText": "Your recent withdrawal request has been completed.",
    //     "color": AppColors.lightBlue,
    //     "imageIcon": AppAssets.tourIcon,
    //   },
    //   {
    //     "mainText": "Withdrawal Processed",
    //     "secondText": "Your recent withdrawal request has been completed.",
    //     "color": AppColors.lightBlue,
    //     "imageIcon": AppAssets.tourIcon,
    //   },
    //   {
    //     "mainText": "Withdrawal Processed",
    //     "secondText": "Your recent withdrawal request has been completed.",
    //     "color": AppColors.lightBlue,
    //     "imageIcon": AppAssets.tourIcon,
    //   },
    //   {
    //     "mainText": "Withdrawal Processed",
    //     "secondText": "Your recent withdrawal request has been completed.",
    //     "color": AppColors.lightBlue,
    //     "imageIcon": AppAssets.tourIcon,
    //   },
    //   {
    //     "mainText": "Withdrawal Processed",
    //     "secondText": "Your recent withdrawal request has been completed.",
    //     "color": AppColors.lightBlue,
    //     "imageIcon": AppAssets.tourIcon,
    //   },
    //   {
    //     "mainText": "Withdrawal Processed",
    //     "secondText": "Your recent withdrawal request has been completed.",
    //     "color": AppColors.lightBlue,
    //     "imageIcon": AppAssets.tourIcon,
    //   },
    //   {
    //     "mainText": "Your investment has been received!",
    //     "secondText": "Your investment in Lattakia Chalet has been received.",
    //     "color": AppColors.green15,
    //     "imageIcon": AppAssets.walletICon,
    //   },
    // ];

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
      body: BlocBuilder<UserNotificationsBloc, UserNotificationsState>(
        builder: (context, state) {
          if (state is UserNotificationsLoading ||
              state is UserNotificationsInitial) {
            ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: NotificationItemShimmer(),
                );
              },
            );
          }
          if (state is UserNotificationsSuccess &&
              state.getNotificationsResponse.data!.isNotEmpty) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<UserNotificationsBloc>().add(
                  GetUserNotificationsEvent(),
                );
              },
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: state.getNotificationsResponse.data!.length,
                itemBuilder: (context, index) {
                  final item = state.getNotificationsResponse.data![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 16,
                    ),
                    child: InkWell(
                      onTap: () {
                        if (item.type == 'create_negotiation' ||
                            item.type == 'update_negotiation' ||
                            item.type == 'reject_negotiation' ||
                            item.type == 'accept_negotiation') {
                          GoRouter.of(
                            context,
                          ).push(AppRouter.kNegotiationNotificationView);
                        }
                      },
                      child: NotificationItem(
                        mainText: item.title!,
                        secondText: item.body!,
                        notificationType: item.type!,
                        // color: item["color"],
                        // imageICon: item["imageIcon"],
                      ),
                    ),
                  );
                },
              ),
            );
          }
          if (state is UserNotificationsSuccess &&
              state.getNotificationsResponse.data!.isEmpty) {
            return SomethingWrongWidget(
              title: "No Notifications found!",
              svgPath: 'assets/images/search.svg',
              elevatedButtonWidget: ElevatedButtonWidget(
                title: "Refresh",
                onPressed:
                    () => context.read<UserNotificationsBloc>().add(
                      GetUserNotificationsEvent(),
                    ),
              ),
            );
          }
          if (state is UserNotificationsFailure) {
            return SomethingWrongWidget(
              elevatedButtonWidget: ElevatedButtonWidget(
                title: "Refresh",
                onPressed: () {
                  context.read<UserNotificationsBloc>().add(
                    GetUserNotificationsEvent(),
                  );
                },
                // () => context.read<InvesetingHistoryBloc>().add(
                //   GetInvestingHistory(page: 1),
                // ),
              ),
            );
          } else {
            return SomethingWrongWidget(
              elevatedButtonWidget: ElevatedButtonWidget(
                title: "Refresh",
                onPressed: () {
                  context.read<UserNotificationsBloc>().add(
                    GetUserNotificationsEvent(),
                  );
                },
                // () => context.read<InvesetingHistoryBloc>().add(
                //   GetInvestingHistory(page: 1),
                // ),
              ),
            );
          }
        },
      ),
    );
  }
}

//NegotiationNotification
