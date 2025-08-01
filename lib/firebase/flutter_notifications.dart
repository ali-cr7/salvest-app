import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:salvest_app/firebase_options.dart';
import 'package:salvest_app/utility/app_colors.dart';
// import 'package:nostra_casa/utility/app_style.dart';

class FlutterNotificationsClass {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static BuildContext? context;

  // @pragma('vm:entry-point')
  // void notificationTapBackground(NotificationResponse notificationResponse) {
  //
  //   // todo: push to notification screen
  //   // Navigator.pushNamed(context!, notificationScreen,
  //   //     arguments: ServiceType.store);
  // }

  static AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'salvest_app',
    'salvest_app', // title// description
    importance: Importance.max,
    enableLights: true,
    ledColor: AppColors.green,
  );

  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Handling a background message ${message.messageId}');
    flutterLocalNotificationsPlugin.show(
      message.data.hashCode,
      message.data['title'],
      message.data['body'],
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          icon: 'ic_notification',
          importance: Importance.max,
          priority: Priority.high,
          enableVibration: true,
        ),
      ),
    );
  }

  Future initLocalNotificationChannel() async {
  const AndroidInitializationSettings initializationSettingsAndroid = 
    AndroidInitializationSettings('ic_notification');
  
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: const DarwinInitializationSettings(),
  );
  
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );
  
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
}

  void localNotificationsRequestPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }

  Future<void> handleForeGroundNotification() async {
    var initializationSettingsAndroid = const AndroidInitializationSettings(
      'ic_notification',
    );
    var initializationSettingsIos = const DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIos,
    );

    // flutterLocalNotificationsPlugin.initialize(
    //   initializationSettings,
    //   onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    //   onDidReceiveNotificationResponse: (details) {
    //     // todo: push to notification screen
    //
    //     // Navigator.pushNamed(context!, notificationScreen,
    //     //     arguments: ServiceType.store);
    //   },
    // );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('message ${message.data}');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      var responseData = message.data;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              icon: 'ic_notification',
              enableLights: channel.enableLights,
              ledColor: channel.ledColor,
              ledOnMs: 100,
              ledOffMs: 3000,
              enableVibration: true,
              color: const Color(0xFF145770),
            ),
          ),
        );
      }
    });
  }
}
