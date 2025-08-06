import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/business_logic/user%20notifications%20bloc/user_notifications_bloc.dart';
import 'package:salvest_app/business_logic/withdrawls%20request%20bloc/withdrawls_request_bloc.dart';
import 'package:salvest_app/presentation/notifications/widgets/notificationItem_shimmer.dart';
import 'package:salvest_app/presentation/notifications/widgets/notification_item.dart';
import 'package:salvest_app/presentation/notifications/widgets/notification_view_body.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/elevated_button_widget.dart';
import 'package:salvest_app/utility/router.dart';
import 'package:salvest_app/utility/somthing_wrong.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: NotificationViewBody(),
    );
  }
}

