import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/business_logic/user%20notifications%20bloc/user_notifications_bloc.dart';
import 'package:salvest_app/presentation/notifications/widgets/notificationItem_shimmer.dart';
import 'package:salvest_app/presentation/notifications/widgets/notification_item.dart';
import 'package:salvest_app/utility/elevated_button_widget.dart';
import 'package:salvest_app/utility/router.dart';
import 'package:salvest_app/utility/somthing_wrong.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserNotificationsBloc, UserNotificationsState>(
      builder: (context, state) {
        if (state is UserNotificationsLoading ||
            state is UserNotificationsInitial) {
        return  ListView.builder(
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
         
            ),
          );
        } 
          return SomethingWrongWidget(
            elevatedButtonWidget: ElevatedButtonWidget(
              title: "Refresh",
              onPressed: () {
                context.read<UserNotificationsBloc>().add(
                  GetUserNotificationsEvent(),
                );
              },
            
            ),
          );
      
      },
    );
  }
}

